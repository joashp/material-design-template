# Task report

## **Spin up a Virtual Machine**
<br>
<p align="center">
<img width="800" alt="virtualbox" src="https://user-images.githubusercontent.com/76659421/136595470-0ba5e8bb-decb-4b2b-9e99-702e0b8df2fe.png">
</p>
</br>

---

## **Install Nginx web server and git**
To install Nginx, run the following commands:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install nginx
#Check the version
nginx -v
#Check nginx status (running or not)
systemctl status nginx
```

To install git, run the following commands:

```bash
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git
#Add to config global variables
git config --global user.name "Nikolay Doroshchenko"
git config --global user.email "mikalaid@playtika.com"
```
Cloning a remote repository:

```bash
git clone https://github.com/Mynaniag/material-design-template.git
```

Generate ssh key:

```bash
ssh-keygen
cat /home/${USER}/.ssh/id_rsa.pub #<----- The output should be copied and pasted into your git settings.
```
---
## **Fork GitHub repository**

1. On GitHub, navigate to the [joashp/material-design-template](https://github.com/joashp/material-design-template).
2. In the top-right corner of the page, click Fork.

<p align="center">
<img width="190" alt="Fork" src="https://user-images.githubusercontent.com/76659421/136669036-be5f845c-5107-4077-881d-159bf288e762.png">
</p>

---

## __Setup a cron job for a regular (every 1 minute) checkout from main branch__

### First step - install cronjob. 

To install cron, run the following commands:
```bash
sudo apt update
sudo apt install cron
```
To enable cron, enter this command:
```bash
sudo systemctl enable cron
```
Output:
```
Synchronizing state of cron.service with SysV service script with /lib/systemd/systemd-sysv-install.
Executing: /lib/systemd/systemd-sysv-install enable cron
```
### Second step - write script.

Open crontab file:
```bash
crontab -e
``` 
After using ``crontab -e`` command, select some text editor and write this line at the end.
```bash
* * * * * cd /home/${USER}/lab/material-design-template && git pull origin master 2>&1 | /usr/bin/logger -t GITLOG1MIN
```
To display logs with information about cronjob operation, enter the following command:
```
grep GITLOG /var/log/syslog
```
Output:
```
Oct  9 19:14:01 mikalaid CRON[28298]: (mikalaid) CMD (cd /home/mikalaid/lab/material-design-template && git pull origin master 2>&1 | /usr/bin/logger -t GITLOG1MIN)
Oct  9 19:14:01 mikalaid GITLOG1MIN: From https://github.com/Mynaniag/material-design-template
Oct  9 19:14:01 mikalaid GITLOG1MIN:  * branch            master     -> FETCH_HEAD
Oct  9 19:14:01 mikalaid GITLOG1MIN: Already up to date.
```

## __-Nginx configuration-__

In order for the site to be accessible in a browser, you must:
1. Configure the ports in the VM:
   
   <img width="638" alt="port" src="https://user-images.githubusercontent.com/76659421/136686663-27bcd038-1a7a-46cd-97f9-1c87c9a072a3.png">

2. Change the line in the ``default`` located in ``etc/nginx/sites-enabled/``:
```bash
root /home/mikalaid/lab/material-design-template/www; #default string <-- root /var/www/html;
```

---

## __Update index.html from your machine, push changes to Git and confirm updated content on web page__

Open index.html file in /www directory and change any line.
```bash
vi index.html
#some changes
```
Push changes to Git:
```
git add .
git commit -m "Change index.html"
git push origin main
```
After that, refresh the page and see the changes. 

<img width="1054" alt="Site new" src="https://user-images.githubusercontent.com/76659421/136685867-cb176ca5-f320-47ce-8695-cd1d68daf2aa.png">


---

## __Configure Github hook instead of cron. If VM is not accessible from the Internet, use local git hooks for validation of incoming commits (reject commits if there is a “shit” string in the files)__

---

## __Configure Nginx to Proxy Websockets and cache static content within 1 hour__

---

## __Merge feature branch with main, rebase git merge commit, squash all commits__




















