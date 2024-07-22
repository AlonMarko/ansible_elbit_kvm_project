#!/bin/bash

# Exit on first error
set -e

# Ensure the script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

# Define the installation directory
INSTALL_DIR="/usr/local/ansible-deployment"

# Copy the ansible-elbit script to /usr/local/bin
sudo cp "$INSTALL_DIR/ansible-elbit" /usr/local/bin/

# Make it executable
sudo chmod +x /usr/local/bin/ansible-elbit

echo "ansible-elbit has been installed successfully and is ready to use."
