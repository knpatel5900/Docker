#!/bin/bash
bold=`tput smso`
unbold=`tput rmso`
under=`tput smul`


clear;

tput cup 3 0; echo "${bold}Welcome to the docker Backup Script${unbold}";
echo"";
echo -n  "Please Press Any Key To View The container Process ";read kk;
docker ps -a
echo"";
echo -n "Enter the Container name to Backup from Listed Above ::- "; read cont;
contid=`docker ps -a | grep $cont | awk '{print $1}'` 
echo"";
echo "your container ID is $contid";
echo"";
echo -n "Enter the name of BAckup file Image and press Any Key to Commit ::- "; read comm;
docker commit $contid $comm 
echo"";
echo "Commit Operation Succesfull Now SAve it..."
echo -n "Press Any Key To Start Saving "; read kp;
mkdir -p /backup/$(date +%m-%d-%y)
cd /backup/$(date +%m-%d-%y)
dt=`date +%H:%M:%S`
docker save -o $comm-BACKUP.tar $comm
echo"";
ls -ltr /backup/$(date +%m-%d-%y)
echo"";
echo "COMPRESSED BACKUP FILES";
tar -tvf *tar
echo "Your Container has been Backuped Succesfully..."; read kp;
