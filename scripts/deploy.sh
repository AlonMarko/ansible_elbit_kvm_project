#!/bin/bash

# Exit on first error
set -e

# Ensure package name is provided
if [ -z "$1" ]; then
  echo "Usage: $0 <package_name.deb>"
  exit 1
fi

PACKAGE_NAME=$(basename "$1")
echo "Original package name: $PACKAGE_NAME"

# Remove any surrounding quotes from the package name
PACKAGE_NAME=$(echo "$PACKAGE_NAME" | tr -d '\"')
echo "Sanitized package name: $PACKAGE_NAME"

# Update the package name in the vars file without extra quotes
echo "package_name: $PACKAGE_NAME" > ../vars/package.yml

# Run the playbook
ansible-playbook -i ../inventory.ini ../playbooks/deploy.yml

