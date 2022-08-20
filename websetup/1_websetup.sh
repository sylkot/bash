#!/bin/bash

# Installing Dependencies
sudo yum install wget unzip httpd -y > /dev/null

# Start & Enable Service
sudo systemctl start httpd
sudo systemctl enable httpd

# Creating Temp Directory
mkdir -p /tmp/webfiles
cd /tmp/webfiles

wget https://www.tooplate.com/zip-templates/2098_health.zip > /dev/null
unzip 2098_health.zip > /dev/null
sudo cp -r 2098_health/* /var/www/html/

# Restart Service
systemctl restart httpd

# Clean Up
rm -rf /tmp/webfiles
