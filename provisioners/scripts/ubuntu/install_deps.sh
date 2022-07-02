#!/bin/bash

echo "Install Dependencies"
whoami
sudo apt-get clean
sudo apt update
sudo apt install -y ansible
ansible --version
ansible-playbook --version
echo "FOO is $FOO" > example.txt
