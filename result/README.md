1. During the execution script assessment.sh, two directories will be created. In directory "test" should be created branch "dev".
In this branch edits should be made to index.html
2. When we changed index.html, we need to send the changes to the server with the following command "git pull origin dev"
3. On GitHub we have to merge branches dev --> master
4. Need uncomment string #cron.* in /etc/rsyslog.d/50-default.conf. Then "systemctl restart rsyslog". Cron executes from "master" branch (g>

*Websocket.
1. During the execution script websocket.sh, will be installed nginx, docker. 
2. Build docker image and run docker container on 5000 port.
3. In directory /etc/nginx/sites-available need to add a file with name "assessment.dvrt.xyz"(It's attached  domain(A record)). 
After the file be added, need create symlink to "/etc/nginx/sites-enabled" following command
ln -s /etc/nginx/sites-available/assessment.dvrt.xyz /etc/nginx/sites-enabled/assessment.dvrt.xyz
and systemctl restart nginx

 
 
