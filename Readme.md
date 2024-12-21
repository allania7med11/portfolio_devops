# Portfolio Deploy - Multipass Environment Setup

This project automates the setup of a virtual development environment using **Multipass** and **Ubuntu 24.04 LTS**.

## Features
- Automatically checks for an existing Multipass instance (`portfolio`).
- Creates an Ubuntu 24.04 LTS instance if it doesn't exist.
- Mounts the current working directory to the instance for easy file sharing.
- Supports dynamic SSH key configuration and generation.

---

## Requirements
1. **Multipass** installed on your system. [Installation Guide](https://multipass.run/install)
2. **Bash shell** (default on Linux and macOS).
3. **SSH Key** (`~/.ssh/id_ed25519.pub`) or provide one with SSH_KEY_PATH env variable.

---

## Getting Started

### 1. Clone or Download This Repository
```bash
git clone https://github.com/your-repo/portfolio.git
cd portfolio
```

### 2. Run the Script
Execute the initialization script:
```bash
./portfolio-init.sh
```

### Configure the Environment
- Ensure you have a valid SSH public key at `~/.ssh/id_ed25519.pub`.
- You can also create a `.env` file to customize the SSH key location or other configurations. For example:
  - `SSH_KEY_PATH=~/.ssh/custom_key.pub`

### Usage Details

### Commands for Multipass Instance Management
- **List Instances**:
  ```bash
  multipass list
  ```
- **Stop the Instance**:  
  ```bash
  multipass stop portfolio
  ```
- **Delete the Instance**:  
  ```bash
  multipass delete portfolio && multipass purge
  ```