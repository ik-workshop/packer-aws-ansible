# Packer AWS Ansbile

Create AWS AMI with packer

Currently installed tooling

- [Ansible](https://www.ansible.com/)
- [Flyway](https://flywaydb.org/)
- [Open JDK](https://openjdk.org/)
- [Docker](https://www.docker.com/)

**What this project is used for**

- Create `AWS AMI` on-demand self-hosted AWS EC2 runner for[GitHub Actions](https://github.com/machulav/ec2-github-runner)
- Create `AWS AMI` for general purpose

---

![](https://img.shields.io/github/commit-activity/m/ik-vms-dockers/packer-aws-ansible)
![](https://img.shields.io/github/last-commit/ik-vms-dockers/packer-aws-ansible)
[![](https://img.shields.io/github/license/ivankatliarchuk/.github)](https://github.com/ivankatliarchuk/.github/LICENCE)
[![](https://img.shields.io/github/languages/code-size/ik-vms-dockers/packer-aws-ansible)](https://github.com/ik-vms-dockers/packer-aws-ansible)
[![](https://img.shields.io/github/repo-size/ik-vms-dockers/packer-aws-ansible)](https://github.com/ik-vms-dockers/packer-aws-ansible)
![](https://img.shields.io/github/languages/top/ik-vms-dockers/packer-aws-ansible?color=green&logo=markdown&logoColor=blue)

---

[![governance][governance-badge]][governance-action]

---

<!-- START doctoc generated TOC please keep comment here to allow auto update -->
<!-- DON'T EDIT THIS SECTION, INSTEAD RE-RUN doctoc TO UPDATE -->
## Contents

- [Prerequisits](#prerequisits)
  - [Commands](#commands)
- [Commands](#commands-1)
  - [Usage](#usage)
  - [Vagrant](#vagrant)
- [Use cases](#use-cases)
  - [Access private resources in your VPC](#access-private-resources-in-your-vpc)
- [Resources](#resources)
- [Create](#create)

<!-- END doctoc generated TOC please keep comment here to allow auto update -->

---

## Prerequisits

```sh
brew tap hashicorp/tap
brew install hashicorp/tap/packer
brew install packer
brew install ansible
```

### Commands

## Commands

### Usage

```sh
aws-vault exec $AWS_PROFILE -- packer init aws-ubuntu.pkr.hcl
aws-vault exec $AWS_PROFILE -- packer build aws-ubuntu.pkr.hcl
```

### Vagrant

```sh
vagrant provision
vagrant up
vagrant status
vagrant halt packer
vagrant ssh packer
vagrant destroy packer --force
```

## Use cases

### Access private resources in your VPC

The action can start the EC2 runner in any subnet of your VPC that you need - public or private.
In this way, you can easily access any private resources in your VPC from your GitHub Actions workflow.

For example, you can access your database in the private subnet to run the database migration.

## Resources

- [Docs](https://www.packer.io/)
- [Ansible Local](https://www.packer.io/plugins/provisioners/ansible/ansible-local)
- [Packer: aws](https://learn.hashicorp.com/collections/packer/aws-get-started)
- [Packer: build image](https://learn.hashicorp.com/tutorials/packer/aws-get-started-build-image?in=packer/aws-get-started)
- [Packer: amazon plugin](https://github.com/hashicorp/packer-plugin-amazon)
- [Packer: by example](https://github.com/ik-vms-dockers/packer-by-example)
- [AWS AMI locator](https://cloud-images.ubuntu.com/locator/ec2/)
- [Packer: docs](https://www.packer.io/plugins/datasources/amazon/parameterstore)
- [Packer: ansible](https://amedee.be/how-big-is-a-clean-install-of-ubuntu-jammy-jellyfish-22-04/)

- [Self hosted - Github Actions: ecs](https://msyea.github.io/technology/2021/01/07/self-hosted-github-actions-on-ecs.html)
- [Self hosted - Github Actions: ec2](https://github.com/machulav/ec2-github-runner#real-user-examples)

- [Github Actions: example](https://github.com/bigscience-workshop/Megatron-DeepSpeed/blob/main/.github/workflows/main.yml)
- [Ansible: flyway](https://github.com/lrk/ansible-role-flyway)
- [Ansible: java](https://github.com/geerlingguy/ansible-role-java)

## Create

[**Create a repository using this template →**][template.generate]

<!-- resources -->
[template.generate]: https://github.com/ik-vms-dockers/packer-aws-ansible/generate
[code-style.badge]: https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square

[governance-badge]: https://github.com/ik-vms-dockers/packer-aws-ansible/actions/workflows/governance.bot.yml/badge.svg
[governance-action]: https://github.com/ik-vms-dockers/packer-aws-ansible/actions/workflows/governance.bot.yml

[governance.link-checker.badge]: https://github.com/ik-vms-dockers/packer-aws-ansible/actions/workflows/governance.links-checker.yml/badge.svg
[governance.link-checker.status]: https://github.com/ik-vms-dockers/packer-aws-ansible/actions/workflows/governance.links-checker.yml
