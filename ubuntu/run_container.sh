#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
apt-get update
apt-get install -y \
    python \
    curl \
    ansible

# Add user
adduser --disabled-password --gecos '' user
adduser user sudo
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

# Ansible deployment
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o /tmp/install.yml
su - user -c "ansible-playbook /tmp/install.yml"

# Create work directory
mkdir -p /workspace
chown user /workspace

# Clean up
apt-get remove -y --auto-remove \
    curl \
    ansible 
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache
