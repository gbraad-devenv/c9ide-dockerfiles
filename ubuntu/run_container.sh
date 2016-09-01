#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
apt-get update
apt-get install -y \
    python \
    curl \
    ansible

# Ansible deployment
cd /tmp
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o install.yml
ansible-playbook install.yml

# Clean up
apt-get remove -y --auto-remove \
    curl \
    ansible 
apt-get clean
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /root/.cache
