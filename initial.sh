#!/bin/bash

# Create user 1001 with uid = 1001
sudo useradd -u 1001 --no-create-home 1001

# Create www and dockers dir
sudo mkdir -p /var/www && sudo chown 1001:1001 /var/www
sudo mkdir -p /var/dockers && sudo chown 1001:1001 /var/dockers

# Install docker on ubuntu
sudo apt-get update
sudo apt-get install -y curl
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
apt-cache policy docker-ce
sudo apt-get install -y docker-ce
sudo systemctl status docker

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

#Add ubuntu and 1001 to docker group
sudo usermod -a -G docker ubuntu
sudo usermod -a -G docker 1001

exit
