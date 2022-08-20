#!/bin/bash

# Variable Declaration
PACKAGE="httpd wget unzip"
SVC="httpd"
URL='https://www.tooplate.com/zip-templates/2098_health.zip'
ART_NAME='2098_health'
TEMPDIR="/tmp/webfiles"

# Installing Dependencies
sudo yum install $PACKAGE -y > /dev/null

# Start & Enable Service
sudo systemctl start $SVC
sudo systemctl enable $SVC

# Creating Temp Directory
mkdir -p $TEMPDIR
cd $TEMPDIR

wget $URL > /dev/null
unzip $ART_NAME.zip > /dev/null
sudo cp -r $ART_NAME/* /var/www/html/

# Restart Service
systemctl restart $SVC

# Clean Up
rm -rf $TEMPDIR