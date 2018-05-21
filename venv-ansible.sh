#!/bin/bash
ANSIBLE_DIR="/opt/ansible"
APT_PREREQS="(python-pip virtualenv)"
VENV_NAME="ansible"
VENV_DIR="$HOME/.virtualenvs/$VENV_NAME"

if [[ -d "$ANSIBLE_DIR" ]]; then
  echo "$ANSIBLE_DIR directory exists"
else
  echo "$ANSIBLE_DIR directory not found, creating"
  sudo mkdir -p "$ANSIBLE_DIR"
fi

echo "Running apt-get update"
sudo apt-get -qq update

echo "Installing ${APT_PREREQS[@]} packages with apt-get"
sudo apt-get install "${APT_PREREQS[@]}" -y

if [[ -d "$VENV_DIR" ]]; then
  echo "ansible virtualenv already exists at $VENV_DIR"
else
  # Set the PROJECT_HOME shell variable to the name of the directory where projects should be created.
  PROJECT_HOME="$HOME/.virtualenvs"

  echo "Creating virtualenv $VENV_NAME (${VENV_DIR}) with virtualenv"
  virtualenv "${VENV_DIR}"

  if [[ $? -ne 0 ]]; then
    echo "The virtualenv command exited with non-zero response code."
    exit 1
  else
    if [[ -d "${VENV_DIR}" ]]; then
      echo "source ${VENV_DIR}/bin/activate"
      source "${VENV_DIR}/bin/activate"
      echo "installing ansible"
      pip install ansible
    else
      echo "${VENV_DIR} not found."
      exit 1
    fi
  fi

fi
