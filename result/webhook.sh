#!/bin/bash

#vars
repo_path=${HOME}/python-github-webhooks
git_username=iprytoliuk1988
git_email=ihor.prytoliuk@gmail.com


#Update and upgrade OS
sudo apt-get update -y && sudo apt-get upgrade -y

#Install nginx
sudo apt-get install nginx -y && echo "Install Nginx complete" || echo "Some problem with installation"

#Install docker
sudo apt-get update -y
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
sudo apt-get update -y
apt-cache policy docker-ce
sudo apt install docker-ce -y

#Add user to docker group
sudo usermod -aG docker ${USER}

#Git credentials
#ssh-keygen #add id_rsa.pub to your github account
git config --global user.name "$git_username"
git config --global user.email "git_email"

#Clone repo
git clone git@github.com:prytoliuk1988/python-github-webhooks.git

#Edit Dockerfile(Change Python version)
sudo sed -i -e 's+2.7-alpine+3.9-alpine+g' $repo_path/Dockerfile

#Rename config.json
sudo mv $repo_path/config.json.sample $repo_path/config.json

#Build docker image
sudo docker build -t websockets python-github-webhooks
sudo docker run -d --name webhooks -p 5000:5000 websockets
