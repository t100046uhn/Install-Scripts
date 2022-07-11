#Installation of Docker
#https://docs.docker.com/engine/install/debian/
#Tested on Debian 11
#!/bin/bash
sudo apt-get update

#Setup Dependencies
sudo apt-get install ca-certificates curl gnupg lsb-release

#Add Docker’s official GPG key
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

#Repository Setup
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

#Docker Engine Installation
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin

#Verify Docker Engine Installation with Commands Below
#docker run hello-world
#docker image ls -a
#docker image rm
#docker ps -a
#docker rm 
