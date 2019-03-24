#!/bin/bash
if [ $UID -ne 0 ]
then
	echo "switch to sudo"
	echo 'yum makecache && yum -y update' | sudo sh
else
	yum makecache && yum -y update
fi
