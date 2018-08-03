#!/bin/bash
if [ $UID -ne 0 ]
then
	echo "switch to sudo"
	sudo yum makecache && sudo yum -y update
else
	yum -y update
fi
