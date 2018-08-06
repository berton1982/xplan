#!/bin/bash
# install kubelet kubeadm kubectl

cat <<EOF > a.repo/etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kube*
EOF
if[ $UID -ne 0]
then
  echo 'switch to sudo'
  echo 'mv a.repo /etc/yum.repos.d/kubernetes.repo &&
    setenforce 0 &&
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes &&
    systemctl enable kubelet && 
    systemctl start kubelet' | sudo sh
else
  mv a.repo /etc/yum.repos.d/kubernetes.repo &&
  setenforce 0
  yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
  systemctl enable kubelet
  systemctl start kubelet
fi
