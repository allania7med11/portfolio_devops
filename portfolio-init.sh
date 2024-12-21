#!/bin/bash

# Variables
VM_NAME="portfolio"
UBUNTU_VERSION="noble"  
CPUS="2"
MEMORY="4000M"
DISK="20G"
SSH_KEY="${HOME}/.ssh/id_ed25519.pub"  # Path to your SSH public key
MOUNT_PATH="/home/ubuntu/portfolio"  # Mount current directory to this path in the VM

# Function to create a Multipass VM
create_vm() {
  echo "Creating a Multipass VM named $VM_NAME with the following configuration:"
  echo "Ubuntu Version: $UBUNTU_VERSION"
  echo "CPUs: $CPUS"
  echo "Memory: $MEMORY"
  echo "Disk: $DISK"
  multipass launch $UBUNTU_VERSION --name $VM_NAME --cpus $CPUS --memory $MEMORY --disk $DISK
}

# Function to configure SSH
configure_ssh() {
  if [ -f "$SSH_KEY" ]; then
    echo "Configuring SSH for the VM..."
    multipass exec $VM_NAME -- bash -c "mkdir -p ~/.ssh && echo '$(cat $SSH_KEY)' >> ~/.ssh/authorized_keys && chmod 600 ~/.ssh/authorized_keys"
    echo "SSH key has been copied to the VM."
  else
    echo "SSH public key not found at $SSH_KEY. Please generate one using 'ssh-keygen' if needed."
    exit 1
  fi
}

# Function to mount the current directory
mount_directory() {
  echo "Mounting the current directory to $MOUNT_PATH in the VM..."
  multipass mount . $VM_NAME:$MOUNT_PATH
  echo "Directory mounted successfully."
}

# Check if the VM already exists
if multipass list | grep -q "$VM_NAME"; then
  echo "VM named $VM_NAME already exists. Skipping creation."
else
  create_vm
fi

# Configure SSH and mount the directory
configure_ssh
mount_directory

echo "Multipass VM setup complete. Access the VM with the following command:"
echo "multipass shell $VM_NAME"
