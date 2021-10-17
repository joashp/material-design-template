#Week2_CI_CD_tools


**1. Create Jenkins main**

Create jenkins-main VM:
- Deploy VM in datacenter with current OS:

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/ubuntu_dist.png)

- Update and upgrade packages                              
$sudo apt update -y && sudo apt upgrade -y

- Create new user and add ssh-key to VM(Add key from other VM)

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/add_ssh_key_to_jenkins-main.png)

- Disable ssh auth for root user and disable password authentication:                                    
$sudo nano /etc/ssh/sshd_config                                      
PermitRootLogin yes --> PermitRootLogin no                                   
#PasswordAuthentication yes --> PasswordAuthentication no                            

- Restart ssh                                                    
$sudo systemctl restart sshd

- Install openjdk-8-jdk                                                   
$sudo apt-get install openjdk-8-jdk -y


![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/openjdk_version.png)

#####Install Jenkins#####                                               
- Add GPG keys Jenkins                                                  
$wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -

- Add repository Jenkins                                         
$sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

- Update packages                                    
$sudo apt update -y                                    

- Install Jenkins                                     
$sudo apt install jenkins -y

- Enable autostart Jenkins                                             
$sudo systemctl enable jenkins     

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/Jenkins_status.png)

- Change default Jenkins port                                
$sudo nano /etc/default/jenkins
HTTP_PORT=8080 --> HTTP_PORT=8081

- Restart Jenkins                             
$sudo systemctl restart jenkins

#####Configure Jenkins#####
- Initial admin password
$sudo cat /var/lib/jenkins/secrets/initialAdminPassword
#Paste password for unlock Jenkins

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/initial_admin_passwd.png)

- Add plugins: GitHub, Role-based authorization strategy

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/install_plugins.png)

- Add new user

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/add_new_user.png)


#####Install git#####

- Add git repository                               
$sudo add-apt-repository ppa:git-core/ppa

- Update and upgrade packages                                   
$sudo apt update -y && sudo apt upgrade -y

- Install git                                      
$sudo apt-get install git -y

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/git_version_main.png)





**2-Create Jenkins-agent VM**


- Update and upgrade packages                                 
$sudo apt update -y && sudo apt upgrade -y

- Install software packages                                   
$sudo apt install software-properties-common apt-transport-https -y

- Add the PPA repository for java                         
$sudo add-apt-repository ppa:openjdk-r/ppa -y

- Install openjdk ver-8                       
$sudo apt install openjdk-8-jdk -y

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/java_version_agent.png)

#####Install git#####

- Add git repository                   
$sudo add-apt-repository ppa:git-core/ppa

- Update and upgrade packages                            
$sudo apt update -y && sudo apt upgrade -y

- Install git                      
$sudo apt-get install git -y

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/git_version_agent.png)


#####Connect agent to master node#####

- In main-node configure user 'jenkins' with sudo permissions. Add ssh key for user 'jenkins' 
- In agent-jenkins node add user jenkins with sudo permissions. Copy ssh-key from main-node

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/add_ssh_key_from_main_node.png)


- In main page Manage Jenkins --> Manage Nodes and Cloud --> New Node
- Add node with nodename 'agent-jenkins'

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/agent_nodename.png)

- Configure agent setting.

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/agent_settings_new.png)

- Add ssh-key 

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/ssh_creds_agent.png)

- Jenkins agent is connected ti main node

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/list_of_nodes.png)



**3  3.	Configure tools – NodeJS**

- Install NodeJS plugin 

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/node_plugin.png)

- Add nodejs installation:
Manage Jenkins --> Global tool configuration --> add NodeJS installation(with name 'nodejs', ver '16.11.1', Global npm packages to install 'clean-css-cli uglify-js'

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/nodejs_installation.png)


















(*) **Spin up VM with installed Artifactory**

- Update packages
$sudo apt update -y

- Importing the GPG key
$wget -qO - https://releases.jfrog.io/artifactory/api/gpg/key/public | sudo apt-key add -

- Add the JFrog Artifactory to Ubuntu 20.04.
$echo "deb https://releases.jfrog.io/artifactory/artifactory-pro-debs focal main" | sudo tee -a /etc/apt/sources.list
$echo "deb https://releases.jfrog.io/artifactory/artifactory-debs focal main" | sudo tee -a /etc/apt/sources.list

- Update packages
sudo apt update -y

- Install JFrog Artifactory
$sudo apt install jfrog-artifactory-oss -y

- Start and enable artifactory
$sudo systemctl start artifactory
$sudo systemctl enable artifactory
$sudo systemctl status artifactory

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/artifactory_status.png)

- Config artifactory

![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/artifactory_start.png)
![Image alt](https://github.com/prytoliuk1988/material-design-template/blob/master/Week2_CI-CD_tools/artifactory_url.png)

