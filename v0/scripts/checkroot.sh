#!/bin/bash
#===================
# judge if current user is root, if it is not, switch to user root
#===================

#=======
# function judge if current user is root
#=======
judgeUser(){
	if [ "$UID" == 0 ]
	then
		return 1
	else
		echo  -e "$uid" 
		echo -e "$(whoami)"
		return 0
	fi
}

#=======
# function switch to root
#=======
suRoot(){
	echo "==> current user is $(whoami), now swith to root"
	su
}

#=======
# main procedure
#=======
$(judgeUser) && suRoot
exit 0
