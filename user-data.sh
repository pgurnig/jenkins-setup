#!/bin/bash

# setup the jenkins directory
sudo mkdir /var/lib/jenkins
# add the jenkins user
sudo useradd -d /var/lib/jenkins jenkins
# change the owner of the jenkins directory to jenkins
sudo chown jenkins:jenkins /var/lib/jenkins
# create the directory for the public/private keypair
sudo mkdir /var/lib/jenkins/.ssh
#generate the public private keypair
ssh-keygen -b 2048 -t rsa -f /tmp/id_rsa -q -N ""
# copy the private key to the jenkins folder
sudo cp /tmp/id_rsa /var/lib/jenkins/.ssh/authorized_keys
# copy the public key to the jenkins folder
sudo cp /tmp/id_rsa.pub /var/lib/jenkins/.ssh/
# jenkins needs java
sudo yum install java-1.8.0-openjdk-devel -y
# we'll need git installed since we're working with a git repository
sudo yum install git -y
# assuming maven
sudo yum install maven -y
# we will need wget
sudo yum install wget -y
# patch the server
sudo yum upgrade -y

sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
sudo rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
sudo yum install jenkins -y
sudo service jenkins start

sudo yum install yum-cron -y


change the prompt
PS1="[\u \h \W Jenkins Remote]$ "

Note that I did register one of the boxes:
insights-client --register


