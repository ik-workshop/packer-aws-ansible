packer {
  required_plugins {
    amazon = {
      version = ">= 1"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "builder" {
  type    = string
  default = "Packer"
}

variable "os_version" {
  type    = string
  default = "focal-20.04"
}

variable "skip_create_ami" {
  type        = bool
  default     = false
  description = "If true, Packer will not create the AMI. Useful for setting to true during a build test stage. Default false."
}

locals {
  timestamp      = regex_replace(timestamp(), "[- TZ:]", "")
  arch           = "amd64"
  region         = "us-west-2"
}

data "amazon-ami" "ubuntu-jammy-22-amd64" {
  filters = {
    name                = "ubuntu/images/*ubuntu-${var.os_version}-amd64-server-*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }
  most_recent = true
  owners      = ["099720109477"]
}

source "amazon-ebs" "basic" {
  ami_name      = "ubuntu-base-packer-${local.timestamp}"
  region        = local.region
  instance_type = "t3.medium"
  communicator  = "ssh"
  source_ami    = data.amazon-ami.ubuntu-jammy-22-amd64.id
  ssh_username  = "ubuntu"
  # cost
  spot_price      = "auto"
  skip_create_ami = var.skip_create_ami

  run_tags = {
    Name        = "ubuntu-base-packer-${local.timestamp}"
    BuildName   = "{{build_name}}"
    Application = "ec2-github-runner"
    OS          = "Ubuntu ${var.os_version}"
    BuildBy     = var.builder
    Runner      = "EC2"
  }
}

build {
  name    = "create-ami-github-runner"
  sources = ["source.amazon-ebs.basic"]

  provisioner "shell" {
    environment_vars = [
      "FOO=provision github runner",
    ]
    scripts=[
      "./provisioners/scripts/ubuntu/install_deps.sh",
      "./provisioners/scripts/ubuntu/install_docker.sh",
    ]
  }

  provisioner "ansible" {
    playbook_file = "./provisioners/ansible/playbooks/default/main.yaml"
  }

  provisioner "ansible-local" {
    playbook_file = "./provisioners/ansible/playbooks/flyway.yaml"
    role_paths= [
      "./provisioners/ansible/roles/jdk",
      "./provisioners/ansible/roles/tools",
      "./provisioners/ansible/roles/flyway",
    ]
  }
}
