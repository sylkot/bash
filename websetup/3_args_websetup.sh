#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
#URL='https://www.tooplate.com/zip-templates/2098_health.zip'
#ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
sudo yum install $PACKAGE -y > /dev/null

# Start & Enable Service
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Creating Temp Directory
mkdir -p $TEMPDIR
cd $TEMPDIR
echo

wget $1 > /dev/null
unzip $2.zip > /dev/null
sudo cp -r $2/* /var/www/html/
echo

# Restart Service
systemctl restart $SVC

# Clean Up
rm -rf $TEMPDIR