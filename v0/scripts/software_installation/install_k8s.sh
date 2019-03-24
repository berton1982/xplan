#!/bin/bash
# install kubelet kubeadm kubectl

# set kubernetes repositry
cat <<EOF > a.repo
[kubernetes]
name=Kubernetes
baseurl=https://mirrors.aliyun.com/kubernetes/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=0
EOF

# set iptables
cat <<EOF > k8s.conf
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

# close swap
cat /etc/fstab | gawk '{
  if($2=="swap"){
    delimiter="#"
    print delimiter $0
  }else{
    print $0
  } 
}' > fstab

#shutdown selinux
cat /etc/sysconfig/selinux | sed '/^SELINUX=/c\SELINUX=disabled' > selinux

if [ $UID -ne 0 ]
then
  echo 'switch to sudo'
  echo 'mv a.repo /etc/yum.repos.d/kubernetes.repo &&    
    mv selinux /etc/sysconfig/selinux &&
    mv k8s.conf /etc/sysctl.d/k8s.conf && sysctl --system &&
    mv fstab /etc/fstab &&
    setenforce 0 &&
    yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes &&
    systemctl disable firewall &&
    systemctl enable kubelet && 
    systemctl start kubelet' | sudo sh
  # kubectl auto completion
  source <(kubectl completion bash)
  echo "source <(kubectl completion bash)" >> ~/.bashrc
else
  mv a.repo /etc/yum.repos.d/kubernetes.repo
  mv selinux /etc/sysconfig/selinux 
  mv k8s.conf /etc/sysctl.d/k8s.conf && sysctl --system
  mv fstab /etc/fstab
  setenforce 0
  yum install -y kubelet kubeadm kubectl --disableexcludes=kubernetes
  systemctl enable kubelet
  systemctl start kubelet
  # kubectl auto completion
  source <(kubectl completion bash)
  echo "source <(kubectl completion bash)" >> ~/.bashrc
fi
