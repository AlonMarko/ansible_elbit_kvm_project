#!/bin/bash

# Exit on first error
set -e

# Update and install Ansible
sudo apt-get update
sudo apt-get install -y ansible

# Ensure the log directory and file exist and set the correct permissions
sudo mkdir -p /var/log
sudo touch /var/log/ansible.log
sudo chmod 666 /var/log/ansible.log

# Define the installation directory
INSTALL_DIR="/usr/local/ansible-deployment"

# Copy the entire repository to the installation directory
sudo rm -rf "$INSTALL_DIR"
sudo cp -r "$(dirname "$(realpath "$0")")/.." "$INSTALL_DIR"

# Set the correct permissions for the vars directory and its contents
sudo chmod -R 777 "$INSTALL_DIR/vars"

# Run the ansible-elbit install script
sudo "$INSTALL_DIR/scripts/install-ansible-elbit.sh"

echo "Ansible setup complete. You can now deploy packages using ansible-elbit <package_name.deb>"
