#!/bin/sh

MYDIR = "webbackend"
MYPORT = "3200"

# update system
apt-get update
apt-get -y upgrade

# install nginx
apt install nginx

# confirm that nginx will boot at start
systemctl enable nginx

# Enable ufw firewall
ufw enable 

# allow Nginx through firewall
ufw allow 'Nginx HTTP'
ufs status


# make a copy of default conf for new site
cp ./vh-3200 /etc/nginx/sites-available/vh-3200
cp ./custom404.html /var/www/$MYDIR


# replace #PORT# with 3200
sed -i -e 's/#PORT#/'$MYPORT'/g' /etc/nginx/sites-available/vh-3200

# replace #DIR# with webbackend
sed -i -e 's/#DIR#/'$MYDIR'/g' /etc/nginx/sites-available/vh-3200


sed -i -e 's/#SERVERNAME#/'$SERVERNAME'/g' /etc/nginx/sites-available/vh-3200

# activate the new site
ln -s /etc/nginx/sites-available/vh-3200 /etc/nginx/sites-enabled/002-vh-3200











