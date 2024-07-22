
# Ansible Configurations for Deployment

This repository contains Ansible configurations and scripts for deploying and managing software packages on multiple Raspberry Pi devices in a closed network. It includes playbooks, inventory files, and setup scripts to streamline the process of updating and configuring devices.

## Repository Structure

```
ansible_elbit_kvm_project/
├── ansible.cfg
├── inventory.ini
├── playbooks/
│ └── deploy.yml
├── debs/
├── vars/
│ └── package.yml
├── scripts/
│ ├── setup-ansible.sh
│ ├── deploy.sh
│ └── install-ansible-elbit.sh
└── ansible-elbit
```

## Getting Started

### Prerequisites

- Ansible installed on your control machine.
- SSH access set up between the control machine and the Raspberry Pi devices.

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/yourusername/ansible-elbit_kvm_project.git
   cd ansible-elbit_kvm_project
   ```

2. **Run the Setup Script:**

   ```bash
   ./scripts/setup-ansible.sh
   ```

## Usage

### Adding .deb Packages

Place any new `.deb` packages you wish to deploy in the `debs/` directory.
Altough it is not mandatory. it is for good practice.

### Updating the Inventory

Modify the `inventory.ini` file to include the IP addresses and SSH details of your Raspberry Pi devices:

```ini
[raspberrypi]
pi1 ansible_host=192.168.1.101 ansible_user=elbit ansible_ssh_private_key_file=~/.ssh/id_rsa
pi2 ansible_host=192.168.1.102 ansible_user=elbit ansible_ssh_private_key_file=~/.ssh/id_rsa
# Add entries for all other Raspberry Pi devices
```

### Run the Deployment Script


Deploy a .deb Package:

```bash
ansible-elbit /path/to/your_package.deb
```
## Scripts

- setup-ansible.sh: Sets up the Ansible environment and installs the ansible-elbit command.
- deploy.sh: Handles the deployment of the .deb package.
- install-ansible-elbit.sh: Installs the ansible-elbit command in /usr/local/bin.
## Notes

- Ensure SSH keys are set up for passwordless access to all Raspberry Pi devices listed in `inventory.ini`.
- The specified user in the inventory file (`ansible_user`) should have sudo privileges.

