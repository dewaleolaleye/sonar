#!/bin/bash

    #Author : Wale
    #Date : 06-Sep-2022

#Description: Install Sonarqube on CentOS 7

echo “Installation of SonarQube in progress. Please be patient…”

#This process need to be run as regular user (Sonarqube doesn’t work when you start it as root user).

echo “Install java 11:”
sudo yum update -y
sudo yum install java-11-openjdk-devel -y 
sudo yum install java-11-openjdk -y
echo

echo “Navigate to the /opt directory:”
cd /opt 
echo

echo “Install wget:”
sudo yum install wget -y
echo

echo “Download and install SonarQube package:”
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip
echo

echo “Install unzip:”
sudo yum install unzip -y
echo

echo “Unzip the previously installed package:”
sudo unzip /opt/sonarqube-9.3.0.51899.zip
echo

echo “Change ownership to the user:”
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
echo

echo “Switch to linux binaries directory:”
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64
echo

echo “Start the daemons:”
./sonar.sh start
echo

echo “Check Sonarqube status:”
./sonar.sh status
echo

echo "Get IP address:"
hostname -I
echo

#Connect to the Sonarqube server through the browser by using the url:
echo “url:  http://192.168.56.33:9000”

echo “Sonarqube installed  and started successfully.”
