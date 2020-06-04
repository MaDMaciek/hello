#!/bin/bash

# Update packages
echo "[TASK 1] Update packages"
sudo apt-get update -y

# Install Docker
echo "[TASK 2] Install Docker"
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y

# Run container
echo "[TASK 3] Run smaple angular app"
sudo docker build --pull --rm -t hello:test "."
sudo docker run -d -p 80:80 hello:test