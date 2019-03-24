#!/bin/bash
# switch user to root
if [[ $EUID -eq 0 ]]
then
	echo "root"
else
	echo $(whoami)
fi
exit 0
