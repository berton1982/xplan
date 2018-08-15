#/bin/bash

k8s_version=$(kubeadm version | gawk -F, '{print $3}' | gawk -F: '{print $2'} | sed 's/"//g')

# using calico, and using master ip
if [ $UID -eq 0 ]
then
  kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=$k8s_version
else
  echo 'switch to sudo'
  echo "kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=${k8s_version} --ignore-preflight-errors='IsPrivilegedUser,Swap'" | sh
fi
