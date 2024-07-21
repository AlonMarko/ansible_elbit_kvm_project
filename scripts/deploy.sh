#!/bin/bash

# Exit on first error
set -e

# Update the package name in the vars file
PACKAGE_NAME=$1
echo "package_name: \"$PACKAGE_NAME\"" > ../vars/package.yml

# Run the playbook
ansible-playbook -i ../inventory.ini ../playbooks/deploy.yml
