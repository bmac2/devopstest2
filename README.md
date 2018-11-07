# devopstest2
script test to build website

STEPS TO USE THESE SCRIPTS

1.  Install ubuntu server in either a virtual environment, or a bare metal install.  Make sure it has an IP Address, and is accessible using SSH and that it has git installed.

2.  SSH into the ubuntu server you created in step 1.

3.  clone this repository, and unless you want to set up ssh keys, I reccomend using the https clone command to do this.

        git clone https://github.com/bmac2/devopstest2.git

4.  Once you have cloned the repository, go into the devopstest2 directory and either chmod +x install.sh, or chmod 755 install.sh, either way you prefer, they both make the install.sh script executable.

5.  Check the variables set in the install.sh file to make sure the port and server names are what you desire.

6.  Run the install.sh script AS ROOT.  This will do the following items to your server:

6 a.  update and then upgrade your server for all available patches

6 b.  install nginx
  
6 c. enable ufw firewall
  
6 d.  open port 3200 to allow outside traffic to access the webserver. All other traffic (i.e. 80 and 443 ) will be blocked to any other port.
  
6 e.   copies the virtual host template in place, then edits the template to put the correct values in for the placeholders
  
6 f.  restartx nginx
  
  
