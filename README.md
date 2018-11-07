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
  
  
I used the following setup to test this version of the script:

1. Mint Linux Laptop for development

2. Virtualbox to run ubuntu server in

3. Ubuntu Server 18.04 LTS server iso

4. Sublime text editor for coding

5. Thinkpad with FreeBSD 11.2 installed to test the connection to the webserver.  In the /etc/host file I added entries to 127.0.0.1 for both www.example.com, which is in the directions, along with www.barryissmart.com to the same 127.0.0.1 so I could make sure the machine sends the custom 404 page i built for anything other than the www.example.com address.

6.  nmap on the freebsd machine to test for open ports on the webserver.  ONLY 22 and 3200 should be available from outside.

7. Obviously firefox on the FreeBSD machine.

8. Standard bash shell scripting.

9.  netcat command 'nc -l 3400' to simulate an application listening on port 3400 on localhost.  To test the port outside of nginx you use 'nc -v localhost 3400' and it should say Connection to localhost 3400 port succeeded!

10  To test the final setup I started the listener on the above step with an & after it to allow it to be pushed into the background.   Then I went to my Freebsd laptop and ran nc -v www.example.com 3200 and successfully got back the connection succeeded that was actually on port 3400 on the backend.
