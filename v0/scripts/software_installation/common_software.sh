#!/bin/bash
# check and install git
yum list installed | grep "^git" || sudo yum -y install git


