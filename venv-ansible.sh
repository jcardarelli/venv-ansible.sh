#!/bin/bash

ANSIBLE_DIR=/opt/ansible

if [[ -d $ANSIBLE_DIR ]]; then
  echo "$ANSIBLE_DIR exists"
else
  echo "directory  not found, creating"
  sudo mkdir -p $ANSIBLE_DIR
fi

sudo apt-get update
sudo apt-get install python python-pip virtualenv -y
