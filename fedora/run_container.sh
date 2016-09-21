#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
dnf install -y \
    curl \
    python2-dnf \
    ansible \
    tar \
    which \
    sudo

# Create user
adduser user
echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user

# Ansible deployment
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o /tmp/install.yml
su - user -c "ansible-playbook /tmp/install.yml"

## Create work directory
mkdir -p /workspace
chown user:user /workspace

# Clean up
dnf clean all
rm /tmp/install.yml
