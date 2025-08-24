#!/bin/bash
apt-get update -y
apt-get install nginx -y
systemctl start nginx
systemctl enable nginx
echo "<h1> Welcome to the very first page of the Ubuntu Ec2 instace with Nginx!</h1>" > /var/www/html/index.html
