#!/bin/bash

echo "Install Docker"
sudo apt install -y docker.io
# sudo groupadd docker
sudo usermod -aG docker "${USER}"
sudo chmod 666 /var/run/docker.sock

echo "Test Docker"
docker pull hello-world
docker images
docker run hello-world
