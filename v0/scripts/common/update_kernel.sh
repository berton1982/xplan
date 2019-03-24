#!/bin/bash
# todo : resolve problem
if [ $UID -ne 0]
then
  echo 'rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org &&
      rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm && 
      yum -y --enablerepo=elrepo-kernel -y install kernel-ml.x86_64 &&
      grub2-set-default 0' | sudo sh
else
  rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org
  rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm
  yum -y --enablerepo=elrepo-kernel -y install kernel-ml.x86_64
  grub2-set-default 0
fi
