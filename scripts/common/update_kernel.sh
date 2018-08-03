echo `rpm --import https://www.elrepo.org/RPM-GPG-KEY-elrepo.org &&
rpm -Uvh http://www.elrepo.org/elrepo-release-7.0-3.el7.elrepo.noarch.rpm && 
yum -y --enablerepo=elrepo-kernel -y install kernel-ml.x86_64` | sudo sh
