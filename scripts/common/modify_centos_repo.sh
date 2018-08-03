#!/bin/bash
function su_modify_centos_repo {
	# check current repo
	mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.origin && echo "curl -o /etc/yum.repos.d/CentOS-Base.repo $1" | sh
}
function modify_centos_repo {
	# check if current Centos_Base.repo is aliyun base
	if  grep mirrorlist.centos.org /etc/yum.repos.d/CentOS-Base.repo > /dev/null 
	then
		local version=$(sed -n 's/ /\n/gp' /etc/redhat-release | sed -n '/[[:digit:]]/p' | sed -n 's/\./\n/gp' | sed -n '1p')
		local ali_repo_url=$(echo "http://mirrors.aliyun.com/repo/Centos-$version.repo")
		
		# backup original CentOS-Base.repo
		
	fi
}
modify_centos_repo
