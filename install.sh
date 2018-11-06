#!/bin/sh

# install nginx
apt install nginx

# enable at boot
systemctl enable nginx

# make a copy of default conf for new site
cp /etc/nginx/sites-available/default /etc/nginx/sites-available/vh-3200

# replace port 80 with 3200
sed -i -e 's/80/3200/g' /etc/nginx/sites-available/vh-3200

# activate the new site
ln -s /etc/nginx/sites-avialable/vh-3200 /etc/nginx/sites-enabled/002-vh-3200




