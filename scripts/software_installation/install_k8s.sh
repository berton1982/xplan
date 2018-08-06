#!/bin/bash
# install docker community version, kubernetes & etc.


# install docker community version
echo `yum install -y yum-utils device-mapper-persistent-data lvm2 &&
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo &&
yum -y install docker-ce &&
systemctl enable docker` | sudo sh

# add docker group and add current user to this group. for The docker daemon binds to a Unix socket instead of a TCP port. By default that Unix socket is owned by the user root and other users can only access it using sudo. The docker daemon always runs as the root user.
# If you don’t want to use sudo when you use the docker command, create a Unix group called docker and add users to it. When the docker daemon starts, it makes the ownership of the Unix socket read/writable by the docker group.
# sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker


# add daocloud mirror
echo `curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://791bb63a.m.daocloud.io &&
systemctl start docker` | sudo sh
