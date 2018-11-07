#!/bin/bash
set -xe

MYPORT="3200"
SERVERNAME="www.example.com"

# update system
apt-get update
apt -y upgrade 

# install nginx
apt -y install nginx

# confirm that nginx will boot at start
systemctl enable nginx

# Enable ufw firewall
ufw enable 

# allow Nginx through firewall
ufw allow 3200
ufw allow 22
ufw status


# make a copy of default conf for new site
cp ./vh-3200 /etc/nginx/sites-available/vh-3200
cp ./custom_404.html /usr/share/nginx/html
cp ./th.jpeg /usr/share/nginx/html

# replace #PORT# with 3200
sed -i -e 's/#PORT#/'$MYPORT'/g' /etc/nginx/sites-available/vh-3200

sed -i -e 's/#SERVERNAME#/'$SERVERNAME'/g' /etc/nginx/sites-available/vh-3200

# activate the new site
ln -s /etc/nginx/sites-available/vh-3200 /etc/nginx/sites-enabled/002-vh-3200

# restart nginx 
systemctl restart nginx











