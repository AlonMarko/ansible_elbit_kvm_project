#!/bin/bash

# Exit on first error
set -e

# Update and install Ansible
sudo apt-get update
sudo apt-get install -y ansible

# Navigate to the Ansible directory
cd "$(dirname "$0")/.."

echo "Ansible setup complete. You can now deploy packages using ./scripts/deploy.sh <package_name.deb>"
