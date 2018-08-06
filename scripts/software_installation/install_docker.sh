#!/bin/bash
# install docker community version, kubernetes & etc.


# install docker community version
if [ $UID -ne 0]
then
	echo 'switch to sudo'
	echo 'yum install -y yum-utils device-mapper-persistent-data lvm2 &&
	  yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&
	  yum -y install docker-ce &&
	  systemctl enable docker &&
	  gpasswd -a $USER docker &&
	  curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://791bb63a.m.daocloud.io &&
	  systemctl start docker' | sudo sh && newgrp docker && docker ps
else	
	yum install -y yum-utils device-mapper-persistent-data lvm2
	yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
	yum -y install docker-ce 
	systemctl enable docker 
	curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://791bb63a.m.daocloud.io 
	systemctl start docker
fi
