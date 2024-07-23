#!/bin/bash

# Path to the inventory file
INVENTORY_FILE="../inventory.ini"

# Path to the SSH public key
SSH_KEY="$HOME/.ssh/id_ed25519.pub"

# Check if the SSH key file exists
if [ ! -f "$SSH_KEY" ]; then
    echo "SSH key file not found at $SSH_KEY"
    exit 1
fi

# Loop through the inventory file and distribute SSH keys
while IFS= read -r line; do
    # Skip empty lines and comments
    if [[ -z "$line" || "$line" =~ ^# || "$line" =~ ^\[ ]]; then
        continue
    fi

    # Extract the hostname, user, and host IP
    HOST=$(echo "$line" | awk '{print $1}')
    USER=$(echo "$line" | grep -oP 'ansible_user=\K\w+')
    HOST_IP=$(echo "$line" | grep -oP 'ansible_host=\K[\d\.]+')

    # Skip if user or host IP is not found
    if [[ -z "$USER" || -z "$HOST_IP" ]]; then
        echo "Skipping invalid line: $line"
        continue
    fi

    # Copy the SSH key to the host
    echo "Copying SSH key to $HOST ($USER@$HOST_IP)"
    ssh-copy-id -i -f "$SSH_KEY" "$USER@$HOST_IP"

done < "$INVENTORY_FILE"

echo "SSH keys distributed successfully."
