#/bin/bash

k8s_version=$(kubeadm version | gawk -F, '{print $3}' | gawk -F: '{print $2'} | sed 's/"//g')

# using calico, and using master ip
if [ $UID -eq 0 ]
then
  kubeadm reset --force && 
  #etcdctl del "" --prefix &&
  kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=$k8s_version
  export KUBECONFIG=/etc/kubernetes/admin.conf
  # install a pod network add-on calico
  kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
  kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
  # allow schedule pods on master.
  kubectl taint nodes --all node-role.kubernetes.io/master-
else
  echo 'switch to sudo'
  # reset environment and del etcd data. and init cluster as root
  echo "kubeadm reset --force && kubeadm init --pod-network-cidr=192.168.0.0/16 --kubernetes-version=${k8s_version} --ignore-preflight-errors='IsPrivilegedUser,Swap'" | sudo sh
  # To make kubectl work for your non-root user, run these commands, which are also part of the kubeadm init output
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  # install a pod network add-on calico
  kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml
  kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml
  # allow schedule pods on master.
  kubectl taint nodes --all node-role.kubernetes.io/master-
fi
