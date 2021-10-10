#!/bin/bash

#Variables all
git_username=iprytoliuk1988
git_email=ihor.prytoliuk@gmail.com
test=${HOME}/siterepo/test
prod=${HOME}/siterepo/prod
repo=git@github.com:prytoliuk1988/material-design-template.git
nginx_config=/etc/nginx/sites-enabled/default

#Update and upgrade OS
sudo apt-get update -y && sudo apt-get upgrade -y

#Install nginx
sudo apt-get install nginx -y && echo "Install Nginx complete" || echo "Some problem with installation"

#Install newest version git
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:git-core/ppa -y
sudo apt-get update -y
sudo apt-get install git -y && echo "Install git complete" || echo "Some problems with installation"

#Git credentials
#ssh-keygen #add id_rsa.pub to your github account
git config --global user.name "$git_username"
git config --global user.email "git_email"

#Check versions Git and nginx
git --version
nginx -v

#dir test - for edit index.html. dir prod - for pulling edited file from github
mkdir -p ${test} ${prod}

#Clone repo for edit index.html
git clone ${repo} ${test}
git clone ${repo} ${prod}

#Edit nginx configuration
sudo sed -i -e 's+root /var/www/html;+root '${prod}'/www;+g' $nginx_config
sudo systemctl restart nginx

#Add task to crontab
crontab -l > cronjob
echo "*/1 * * * * cd '${prod}' && git pull origin master" > cronjob
crontab cronjob
rm cronjob
sudo systemctl restart cron
