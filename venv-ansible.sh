#!/bin/bash
source ./vars.sh

if [[ -d $ANSIBLE_DIR ]]; then
  echo "$ANSIBLE_DIR directory exists"
else
  echo "$ANSIBLE_DIR directory not found, creating"
  sudo mkdir -p $ANSIBLE_DIR
fi

echo "Running apt-get update"
sudo apt-get update

echo "Installing ${APT_PREREQS[@]} packages with apt-get"
sudo apt-get install ${APT_PREREQS[@]} -y


if [[ -d $VENV_DIR ]]; then
  echo "ansible virtualenv already exists at $VENV_DIR"
else
  echo "Creating virtualenv $VENV_NAME (${VENV_DIR}) with virtualenvwrapper"

  # Set the PROJECT_HOME shell variable to the name of the directory where projects should be created.
  PROJECT_HOME=$HOME/.virtualenvs

  echo "Setting up virtualenvwrapper"
  source $(whereis virtualenvwrapper | cut -f 2 -d':')/virtualenvwrapper.sh

  echo "mkproject $VENV_NAME"
  mkproject $VENV_NAME

  if [[ $? -ne 0 ]]; then
    echo "The mkproject command exited with non-zero response code."
    exit 1
  else
    echo "installing ansible"
    pip install ansible -t $VENV_DIR --upgrade
  fi
fi

