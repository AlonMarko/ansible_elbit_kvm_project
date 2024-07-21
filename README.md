
# Ansible Configurations for Deployment

This repository contains Ansible configurations and scripts for deploying and managing software packages on multiple Raspberry Pi devices in a closed network. It includes playbooks, inventory files, and setup scripts to streamline the process of updating and configuring devices.

## Repository Structure

```
ansible_elbit_kvm_project/
├── ansible.cfg               # Ansible configuration file
├── inventory.ini             # Inventory file listing Raspberry Pi devices
├── update.yml                # Ansible playbook for updating software packages
├── debs/                     # Directory for storing .deb packages
│   └── new_package.deb       # Example .deb package that can be deployed via deploy.sh
└── scripts/
    └── setup-ansible.sh      # Script to set up Ansible.
    └── deploy.sh             # Script to run the Playbook.
└── vars/
    └──packge.yml             # Store the packge name when deploying.
```

## Getting Started

### Prerequisites

- Ansible installed on your control machine.
- SSH access set up between the control machine and the Raspberry Pi devices.

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/ansible-elbit_kvm_project.git
   cd nsible-elbit_kvm_project
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
pi1 ansible_host=192.168.1.101 ansible_user=elbit ansible_ssh_private_key_file=~/.ssh/id_rsa
pi2 ansible_host=192.168.1.102 ansible_user=elbit ansible_ssh_private_key_file=~/.ssh/id_rsa
# Add entries for all other Raspberry Pi devices
```

### Run the Deployment Script


Navigate to the scripts/ directory and run the deployment script with the package name

```bash
cd ansible-deployment/scripts
./deploy.sh your_package.deb
```
This script will update the package_name in the vars/package.yml file and run the Ansible playbook to deploy the package to all Raspberry Pi devices listed in inventory.ini.

## Notes

- Ensure SSH keys are set up for passwordless access to all Raspberry Pi devices listed in `inventory.ini`.
- The specified user in the inventory file (`ansible_user`) should have sudo privileges.

