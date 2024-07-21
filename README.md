
# Ansible Configurations for Deployment

This repository contains Ansible configurations and scripts for deploying and managing software packages on multiple Raspberry Pi devices in a closed network. It includes playbooks, inventory files, and setup scripts to streamline the process of updating and configuring devices.

## Repository Structure

```
ansible/
├── ansible.cfg               # Ansible configuration file
├── inventory.ini             # Inventory file listing Raspberry Pi devices
├── update.yml                # Ansible playbook for updating software packages
├── debs/                     # Directory for storing .deb packages
│   └── new_package.deb       # Example .deb package
└── scripts/
    └── setup-ansible.sh      # Script to set up Ansible and run the playbook
```

## Getting Started

### Prerequisites

- Ansible installed on your control machine.
- SSH access set up between the control machine and the Raspberry Pi devices.

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/ansible-configurations.git
   cd ansible-configurations
   ```

2. **Prepare the Setup Script:**

   Ensure the setup script is executable:

   ```bash
   chmod +x scripts/setup-ansible.sh
   ```

3. **Run the Setup Script:**

   Execute the script to install Ansible, set up configurations, and deploy the playbook:

   ```bash
   ./scripts/setup-ansible.sh
   ```

## Usage

### Adding .deb Packages

Place any new `.deb` packages you wish to deploy in the `debs/` directory.

### Updating the Inventory

Modify the `inventory.ini` file to include the IP addresses and SSH details of your Raspberry Pi devices:

```ini
[raspberrypi]
pi1 ansible_host=192.168.1.101 ansible_user=pi ansible_ssh_private_key_file=~/.ssh/id_rsa
pi2 ansible_host=192.168.1.102 ansible_user=pi ansible_ssh_private_key_file=~/.ssh/id_rsa
# Add entries for all other Raspberry Pi devices
```

### Running the Playbook

Use the following command to run the playbook and deploy the package:

```bash
ansible-playbook -i inventory.ini update.yml -e "package_name=new_package.deb"
```

## Notes

- Ensure SSH keys are set up for passwordless access to all Raspberry Pi devices listed in `inventory.ini`.
- The specified user in the inventory file (`ansible_user`) should have sudo privileges.

## Examples

### Example 1: Set static IP to 10.0.0.105 on a 10.0.0.x network.

```bash
./scripts/setup-ansible.sh --router 10.0.0.1 --ip 10.0.0.105
```

### Example 2: Configure wlan0 with a static IP of 192.168.1.100, with a Quad9 DNS server and a local fallback DNS server.

```bash
./scripts/setup-ansible.sh --router 192.168.1.1 --ip 192.168.1.100 --dns 9.9.9.9 --dns 192.168.1.1 --interface wlan0
```
