# -*- mode: ruby -*-
# vi: set ft=ruby :

CPUCOUNT = "1"
RAM = "1024"

# sudo apt-get autoremove -y

$setup = <<SCRIPT
#!/bin/sh

# sudo apt-mark hold python2 python2-minimal python2.7 python2.7-minimal libpython2-stdlib libpython2.7-minimal libpython2.7-stdlib
sudo apt update
sudo apt install software-properties-common -y
sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update
sudo apt install -y python3.9
sudo apt install -y python3-pip
sudo apt-get autoremove -y

cat > /etc/bash.bashrc <<EOF
alias python=python3.9
EOF

SCRIPT

Vagrant.configure("2") do |config|
  # config.vm.provision "shell", inline: <<-SHELL
  # apt-get update && apt -y dist-upgrade
  # apt-get install -y curl vim htop info
  # SHELL
  config.vm.define 'packer' do |m|
    m.vm.hostname = 'singleton-terraform'
    m.vm.box = 'bento/ubuntu-20.04'
    m.vm.box_url = 'bento/ubuntu-20.04'

    m.ssh.insert_key = false

    m.vm.network :forwarded_port, guest: 8080, host: 8081

    m.vm.provider 'virtualbox' do |v|
      v.memory = "#{RAM}"
      v.cpus   = "#{CPUCOUNT}"
    end

    # config.vm.provision "version", type: "shell", inline: $setup, privileged: true

    config.vm.provision "ansible_local" do |ansible|
      # ansible.version     = "2.12.6"
      ansible.install_mode  = :default
      ansible.playbook      = "playbooks/playbook.yaml"
      ansible.config_file     = 'ansible.cfg'
      ansible.raw_arguments = ['--diff']
    end
  end

  config.vm.post_up_message="Setup complete `vagrant ssh packer` to ssh into the box"
end
