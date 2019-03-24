#!/bin/bash
# install helm
# if failed to download, check dns
# replace kubernetes-helm.storage.googleapis.com as storage.googleapis.com/kubernetes-helm
if [ ! -f '/usr/local/bin/helm' ]
then
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sed 's/kubernetes-helm.storage.googleapis.com/storage.googleapis.com\/kubernetes-helm/' | sh
fi

# initialize the local CLI and also install Tiller into your Kubernetes cluster in one step
# use aliyun :  https://cr.console.aliyun.com/cn-hangzhou/repositories
release_url="https://github.com/helm/helm/releases/latest"
version=$(curl -SsL $release_url | awk '/\/tag\//' | grep -v no-underline | cut -d '"' -f 2 | awk '{n=split($NF,a,"/");print a[n]}' | awk 'a !~ $0{print}; {a=$0}')

# refer to article:  https://yq.aliyun.com/articles/159601
helm init --upgrade -i registry.cn-hangzhou.aliyuncs.com/google_containers/tiller:$version --stable-repo-url https://kubernetes.oss-cn-hangzhou.aliyuncs.com/charts
