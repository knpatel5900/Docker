#!/bin/bash

#Create nginx Container
docker run --name nginxwebserver -p 8000:80 -d nginx
docker exec -it nginxwebserver bash

#Create nginx Container
docker run --name apachewebserver -p 9000:80 -d httpd
docker exec -it apachewebserver bash

#Create Ubuntu Container
docker run --name ubuntu01 -itd ubuntu
docker exec -it ubuntu01 bash

#Create Centos Container
docker run --name cent01 -itd centos
docker exec -it cent01 bash

#Create Jenkins Container
docker run --name jenkin01 -id -p 8888 jenkins/jenkins
docker exec -it jenkin01 bash
