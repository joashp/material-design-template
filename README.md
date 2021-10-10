Starting a Debian VM:

<img width="904" alt="Screenshot 2021-10-10 at 15 55 27" src="https://user-images.githubusercontent.com/26361903/136696742-e95ff3cb-6f84-4be1-abd7-8b6dbe7f1714.png">

___________________________________________________________________________
All executed commands are in executed_commands.txt. file in the repository.
___________________________________________________________________________

See CRON logs via command: 
    
    sudo grep CRON /var/log/syslog.

And the output of CRON job execution via command: 

    cat cron.log

<img width="1387" alt="Screenshot 2021-10-10 at 17 50 33" src="https://user-images.githubusercontent.com/26361903/136700963-4e2269e5-a3eb-45c9-80a9-1b4f613dc923.png">

<img width="254" alt="Screenshot 2021-10-10 at 17 48 44" src="https://user-images.githubusercontent.com/26361903/136700976-c39cc181-8935-4ef1-9776-9560dce8ddcf.png">

Configuring Nginx by editing:
    
    /etc/nginx/sites-enabled/default

Changing the string "root /var/www/html" to:

    root /home/vhorbach/lab/material-design-template/www;
    
<img width="526" alt="Screenshot 2021-10-10 at 18 01 02" src="https://user-images.githubusercontent.com/26361903/136701639-6b04796c-5371-4b37-ba83-cd1d42f274e3.png">

<img width="1273" alt="Screenshot 2021-10-10 at 18 06 06" src="https://user-images.githubusercontent.com/26361903/136701678-43796072-551a-49c1-b06c-85ce9d6b3c84.png">

Site after updating "index.html" and pushin it to GitHub:

<img width="1136" alt="Screenshot 2021-10-10 at 18 13 21" src="https://user-images.githubusercontent.com/26361903/136701887-7de52487-11bb-4f52-b761-4a1760013eba.png">

<img width="1058" alt="Screenshot 2021-10-10 at 18 13 42" src="https://user-images.githubusercontent.com/26361903/136701893-1080de59-d232-4e0a-bfb8-94080612ad35.png">


Git Log after pushing chages to remote:

<img width="854" alt="Screenshot 2021-10-10 at 18 18 26" src="https://user-images.githubusercontent.com/26361903/136702127-d87907ac-ca4c-4198-b98a-86e6dd4ca854.png">
