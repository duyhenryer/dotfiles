#!/bin/bash
sudo true

echo "SET UP THE REPOSITORY::."
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y

echo ""
echo "Add GPG Key::."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo ""
echo "INSTALL DOCKER ENGINE ::."
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

echo ""
echo "ADD USERMOD"
sudo usermod -aG docker ${USER}

echo "TEST DOCKER AND PULL REDIS::."
sudo docker pull redis

echo "Install docker-compose"
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "docker version"

sudo docker-compose --version

echo "COMPLTED INSTALL DOCKER. !"

