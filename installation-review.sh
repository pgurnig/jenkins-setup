#!/bin/bash

# check to see if git is installed
git --version

# check to see if java is installed
java -version

# does the Jenkins directory exist
ls -l /var/lib/jenkins

# is Maven installed
mvn -v

# is Jenkins running
ps ax | grep Jenkins

# manual step - auto apply updates
sudo vi /etc/yum/yum-cron.conf

# check the cron log
sudo cat /var/log/yum.log

# curl userdata
curl http://169.254.169.254/latest/user-data

