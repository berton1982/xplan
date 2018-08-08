#!/bin/bash

# pre download docker images for k8s.  
# solve unable to get URL "https://dl.k8s.io/release/stable-1.11.txt" ....
K8S_VERSION=v1.11.0
ETCD_VERSION=3.1.12
DASHBOARD_VERSION=v1.8.3
FLANNEL_VERSION=v0.10.0-amd64
DNS_VERSION=1.14.8
PAUSE_VERSION=3.1

images=(kube-proxy-amd64:$K8S_VERSION 
  kube-scheduler-amd64:$K8S_VERSION 
  kube-controller-manager-amd64:$K8S_VERSION 
  kube-apiserver-amd64:$K8S_VERSION
  etcd-amd64:$ETCD_VERSION 
  pause-amd64:$PAUSE_VERSION 
  kubernetes-dashboard-amd64:$DASHBOARD_VERSION 
  k8s-dns-sidecar-amd64:$DNS_VERSION 
  k8s-dns-kube-dns-amd64:$DNS_VERSION
  k8s-dns-dnsmasq-nanny-amd64:$DNS_VERSION)
  
for imageName in ${images[@]}  
do
  docker pull registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
  docker tag registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName k8s.gcr.io/$imageName
  docker rmi registry.cn-hangzhou.aliyuncs.com/google_containers/$imageName
done
