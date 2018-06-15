#!/bin/bash

# Create user 1001 with uid = 1001
sudo useradd -u 1001 --no-create-home 1001

# Create www and dockers dir and give change owner to 1001 user
sudo mkdir -p /var/www && sudo chown 1001:1001 /var/www
sudo mkdir -p /var/dockers && sudo chown 1001:1001 /var/dockers

############## Install docker on ubuntu ##############
# downloads the package lists from the repositories and "updates" them to get information on the newest versions of packages and their dependencies. It will do this for all repositories and PPAs.
sudo apt-get update
# install package curl | curl is a tool to transfer data from or to a server,
sudo apt-get install -y curl
# adds a package key it's basically downloads the key and then adds it in one command with | (pipeline)
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# Is a script which adds an external APT repository to either  /etc/apt/sources.list from official dockers repos
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
# Performs a variety of operations on APT's package cache. apt-cache does not manipulate the state of the system but does provide operations to search and generate interesting output from the package metadata.
apt-cache policy docker-ce
# Install docker comunity edition
sudo apt-get install -y docker-ce
# Enables docker to auto start
sudo systemctl enable docker
# Check service status os docker 
sudo systemctl status docker

################ Install docker-compose ################
# Download a package docker-compose from official Repo to /usr/local/bin/docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.16.1/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
# Set Permission to Docker-compose 
sudo chmod +x /usr/local/bin/docker-compose
# Check version for make sure installed
docker-compose --version

#Add ubuntu and 1001 to docker group
sudo usermod -a -G docker ubuntu
sudo usermod -a -G docker 1001

exit
