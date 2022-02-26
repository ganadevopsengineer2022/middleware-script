#!/bin/bash

#Description: this is a script to automate the dowloading of sonarqube package
#Author: ganad 25 2022

echo "logging in as vagrant user"
sleep 2
su - vagrant
sleep 2

echo "installing Java 11"
sleep 2
sudo yum update -y
 sudo yum install java-11-openjdk-devel -y
  sudo yum install java-11-openjdk -y
  sleep 2

  echo "Downloading latest version of sonarqube:"
  sleep 2
  cd /opt
  sudo yum install wget -y
  sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
  sleep 2

  echo "Extracting packages:"
  sleep 2
  sudo yum install unzip -y
  sudo unzip /opt/sonarqube-9.3.0.51899.zip
  sleep 2

  echo "changing ownership to the user and switching to linux binaries directory"
  sleep 2
  sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
  cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
  ./sonar.sh start

  sudo firewall-cmd --permanent --add-port=9000/tcp
sleep 2ss
  echo "checking the ip address:"
  hostname -i awk '{print$2}'
sleep 2
  echo "type the above ip address followed by ':9000'as the url"