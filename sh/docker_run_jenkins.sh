#!/bin/bash

# 停止目标机器上的jenkins容器
docker stop jenkins
docker rm jenkins

file_path1=/home/jenkins_home
file_path2=/root/jenkis

if [ -d $file_path1 ]; then
    rm $file_path1/* -rf
fi

docker run -itd --name jenkins --restart=always  -u root -p 18080:8080 -p 50000:50000 -v $file_path1:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -v /usr/bin/docker:/usr/bin/docker -v $(which docker):/bin/docker -v /etc/sysconfig/docker:/etc/sysconfig/docker -v /etc/docker:/etc/docker -v /var/lib/docker/tmp:/var/lib/docker/tmp jenkins/jenkins:latest

tar -xzvf $file_path2/jenkins_home.tar -C $file_path1

docker restart jenkins