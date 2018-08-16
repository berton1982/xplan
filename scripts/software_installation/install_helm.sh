#!/bin/bash
# install helm
# if failed to download, check dns
# replace kubernetes-helm.storage.googleapis.com as storage.googleapis.com/kubernetes-helm
curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get | sed 's/kubernetes-helm.storage.googleapis.com/storage.googleapis.com\/kubernetes-helm/' | sh
