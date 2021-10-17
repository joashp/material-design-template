# Week2_CI-CD_tools

## 1. Create Jenkins VM with internet access:

* **install openjdk-8-jdk or openjdk-11-jdk, Git:**

    `apt search openjdk`
    
    `apt-get install -y openjdk-11-jdk git`
    
    <img width="772" alt="Screenshot 2021-10-15 at 08 37 29" src="https://user-images.githubusercontent.com/26361903/137437725-f3644203-75ba-4262-a7c2-46fff7fcea05.png">

* **install Jenkins with enabling autostart on startup:**

    ```
    wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
    sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
    sudo apt-get update
    sudo add-apt-repository universe
    sudo apt-get install jenkins
    systemctl status jenkins
    ```
    <img width="986" alt="Screenshot 2021-10-15 at 08 45 24" src="https://user-images.githubusercontent.com/26361903/137438493-3be01686-e0cc-48d5-a383-1419845771be.png">

* **setup custom port 8081 for Jenkins:**

    `vi /etc/jenkins/default`
    
    <img width="530" alt="Screenshot 2021-10-15 at 08 51 40" src="https://user-images.githubusercontent.com/26361903/137439010-916292b3-5fa4-4352-8ae5-34638589868d.png">

    `systemctl restart jenkins`
    
* **plugins – select plugins, add GitHub and Role-based authorization strategy:**

    <img width="1425" alt="Screenshot 2021-10-15 at 09 04 57" src="https://user-images.githubusercontent.com/26361903/137440157-75ba1472-63f6-4cad-8f92-03da73d6351a.png">
_______________________________________

   <img width="1436" alt="Screenshot 2021-10-15 at 09 06 30" src="https://user-images.githubusercontent.com/26361903/137440258-857ccf46-a3ac-4dea-9033-9a197cf7600a.png">

* **add new user – jenkins-NAME (your fullname, jenkins-linustorvalds):**

    <img width="819" alt="Screenshot 2021-10-15 at 19 11 59" src="https://user-images.githubusercontent.com/26361903/137519752-8d8d3b4a-6848-4d67-bb8c-1739e4503953.png">
________________________________________

   <img width="1443" alt="Screenshot 2021-10-15 at 19 13 46" src="https://user-images.githubusercontent.com/26361903/137519780-0cdabd85-89e2-49ae-b2fc-d0f1a926840e.png">

## 2. Create Agent VM:

* **openjdk-8-jre, Git:**

    `apt search openjdk`
    
    `apt-get install -y openjdk-11-jdk git`

* **prepare SSH keys:**

    `ssh-keygen`
    
    <img width="1443" alt="Screenshot 2021-10-15 at 19 13 46" src="https://user-images.githubusercontent.com/26361903/137521749-1c398314-45c6-42fe-988b-ff87c185dbb7.png">
    
* **connect agent to master node:**

    *creating agent node with launch via ssh:*

    <img width="1431" alt="Screenshot 2021-10-15 at 20 48 59" src="https://user-images.githubusercontent.com/26361903/137531157-bafcb194-8a2e-4cf7-ab0f-516b4e58fe4b.png">

    *adding credentials:*
    
    <img width="1343" alt="Screenshot 2021-10-15 at 20 16 20" src="https://user-images.githubusercontent.com/26361903/137531313-dbf7fcf8-f203-4ef9-a27a-68f0dbe9e1af.png">

    *launching agent:*
    
    <img width="1408" alt="Screenshot 2021-10-15 at 20 44 47" src="https://user-images.githubusercontent.com/26361903/137531464-85b8b525-93cf-49e9-b54d-6dbfa3b681d7.png">
_______________________________________

   <img width="1444" alt="Screenshot 2021-10-15 at 20 48 27" src="https://user-images.githubusercontent.com/26361903/137531502-8284ff23-fde0-47a8-88d0-45e1fcf113ec.png">

   *checking agent with simple pipeline:*
    
   <img width="939" alt="Screenshot 2021-10-15 at 20 54 52" src="https://user-images.githubusercontent.com/26361903/137531664-fd7f7122-ba3a-4402-91ee-73c413991c46.png">
___________________________________________

   <img width="554" alt="Screenshot 2021-10-15 at 20 47 54" src="https://user-images.githubusercontent.com/26361903/137531687-2c7e3538-9610-4997-b68d-2e3e71df18a4.png">

## 3. Configure tools – NodeJS:

* **installing NodeJS Plugin:**

    <img width="1445" alt="Screenshot 2021-10-15 at 21 12 31" src="https://user-images.githubusercontent.com/26361903/137533623-d4f288d5-2179-4aa3-8d86-95419e7869db.png">

* **adding NodeJS to Global Tool Configuration:**

    <img width="1428" alt="Screenshot 2021-10-15 at 21 21 57" src="https://user-images.githubusercontent.com/26361903/137534675-28a99adf-b742-49a0-819b-60bb1e9f02a9.png">

## 4. Create “Multibranch Pipeline” pipeline job (work inside Lab folder):

* **folder name – your name in camel case (LinusTorvalds):** 

* **Git: fork https://github.com/joashp/material-design-template repo:**

    <img width="1425" alt="Screenshot 2021-10-17 at 15 54 24" src="https://user-images.githubusercontent.com/26361903/137628158-a1f9756d-49bd-45b1-9c42-6d912f50e389.png">
___________________________

   <img width="1777" alt="Screenshot 2021-10-17 at 15 50 12" src="https://user-images.githubusercontent.com/26361903/137628176-02d9505f-2d37-48f6-bb87-dbc15225ec7d.png">

_____________________________

   <img width="1265" alt="Screenshot 2021-10-17 at 15 50 32" src="https://user-images.githubusercontent.com/26361903/137628560-3383b461-56f2-4963-b320-b393dc0cace0.png">
   
* **Write Jenkinsfile which describes declarative pipeline:**

    Jenkinsfile with all required steps is in the root directory of the repository.
    
    
____________________________________


### Build Logs of required job described in Jenkinsfile:

    <img width="1661" alt="Screenshot 2021-10-17 at 17 37 37" src="https://user-images.githubusercontent.com/26361903/137632270-9b57bc7b-a8b6-46c1-936a-afebde6824b6.png">

## 5. Setup the GitHub webhook to trigger the jobs:

   **Setting up trigger in Jenkins and GitHub:**

   <img width="1426" alt="Screenshot 2021-10-17 at 18 40 01" src="https://user-images.githubusercontent.com/26361903/137634676-96d56691-6795-4d9a-9d95-ab3a55f1a4b6.png">
   
   <img width="922" alt="Screenshot 2021-10-17 at 18 46 18" src="https://user-images.githubusercontent.com/26361903/137634764-47bba24b-edcd-4b2b-825f-4d90261f20ad.png">

   **Checking connection via GitHub:**
   
   <img width="942" alt="Screenshot 2021-10-17 at 18 47 52" src="https://user-images.githubusercontent.com/26361903/137634849-e39bf537-3125-4bfb-b52f-2b774f6f0009.png">

   <img width="948" alt="Screenshot 2021-10-17 at 18 48 05" src="https://user-images.githubusercontent.com/26361903/137634855-eb8bc887-4a42-4ee2-95fb-1a3f6302090d.png">



   
