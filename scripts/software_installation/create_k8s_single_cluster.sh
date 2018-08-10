#/bin/bash

#tell if command jq exists, if not exists, download
type /user/bin/jq 2>/dev/null || echo 'curl -o jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && mv jq /user/bin/jq && chmod a+x /user/bin/jq' | sudo sh

k8s_version = $(kubeadm version | gawk -F, '{print $3}' | gawk -F: '{print $2'} | sed 's/"//g')

# using calico, and using master ip
if [ $UID ==0 ]
then
  kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=$k8s_version
else
  echo 'kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=$k8s_version' | sudo sh
fi
