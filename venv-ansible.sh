#!/bin/bash
source ./vars.sh

if [[ -d $ANSIBLE_DIR ]]; then
  echo "$ANSIBLE_DIR exists"
else
  echo "directory  not found, creating"
  sudo mkdir -p $ANSIBLE_DIR
fi

echo "Running apt-get update"
sudo apt-get update

echo "Installing python, and python-pip packages with apt-get"
sudo apt-get install python python-pip -y
