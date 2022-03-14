#!/bin/bash

#Author : Dominique
#Date: 9 March 2022

#This script is made by me to automate downloading docker for linode server (script made from video before did not work

if [ USER != root ]
then
echo -e "\n You need to be root user to download Docker\n"
exit 1
fi

echo -e "\n First, we will check that Docker is not currently installed\n"

sleep 3

sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine

echo -e "\nNow we will install the yum utils package...\n"
sleep 3

sudo yum install yum-utils

echo -e "\n Now we will add the docker repository\n"
sleep 3
sudo yum-config-manager --add-repo [https://download.docker.com/linux/centos/docker-ce.repo]

echo -e "\nNow we will install the Docker engine and other required packages...\n"
sleep 3
sudo yum install docker-ce docker-ce-cli containerd.io
#During this step, you may be prompted to accept the GPG key. The fingerprint should be 060A 61C5 1B55 8A7F 742B 77AA C52F EB6B 621E 9F35. Verify these details and enter y to accept.

if [ $? -ne 0 ]
then
echo -e "\nPlease check the script and you may have to enter fingerprint to accept the GPG key...\n"
fi

sleep 3
echo -e  "\nNow we will start and enable the docker engine and containerd...\n"

 sleep 3

systemctl start docker
systemctl enable docker
systemctl enable containerd

echo -e "\nLet us check now the status of Docker to make sure it is running and enabled.....\n"


sleep 3

systemctl status docker

echo -e "\nNow we can verify to see if Docker is properly installed!\n"

sleep 3

sudo docker run hello-world
exit 0
