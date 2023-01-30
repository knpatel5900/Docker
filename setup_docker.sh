#!/bin/bash
echo "[ i ] Patch Updates"
yum update -y
echo "[ i ] Removing Old DOcker Packages"
yum remove docker  docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate  docker-logrotate  docker-engine
echo "[ i ] Installing Utils"
yum install -y yum-utils
echo "[ i ] Setting  Repos.d"
yum-config-manager  --add-repo https://download.docker.com/linux/centos/docker-ce.repo
echo "[ i ] Confguting Docker"
yum install docker-ce docker-ce-cli containerd.io docker-compose-plugin                  
echo "[ i ] Starting Docker Service"
systemctl start docker
echo ""
#sudo docker run hello-world
echo "[ i ] Uninstall Docker"
#yum remove docker-ce docker-ce-cli containerd.io docker-compose-plugin docker-ce-rootless-extras
#sudo rm -rf /var/lib/docker
#sudo rm -rf /var/lib/containerdy
