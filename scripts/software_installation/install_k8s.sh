#!/bin/bash
# install kubelet kubeadm kubectl

cat <<EOF > a.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
EOF

#shutdown selinux
cat /etc/sysconfig/selinux | sed '/^SELINUX=/c\SELINUX=disabled' > a

if [ $UID -ne 0 ]
then
  echo 'switch to sudo'
  echo 'mv a.repo /etc/yum.repos.d/kubernetes.repo &&    
    setenforce 0 &&
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes &&
    systemctl disable firewall &&
    systemctl enable kubelet && 
    systemctl start kubelet' | sudo sh
else
  mv a.repo /etc/yum.repos.d/kubernetes.repo
  setenforce 0
  yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
  systemctl enable kubelet
  systemctl start kubelet

fi
