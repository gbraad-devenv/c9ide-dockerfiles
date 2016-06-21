#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
dnf remove -y vim-minimal
dnf install -y \
    git \
    ansible \
    python-pip \
    python2-dnf

# Ansible deployment
cd /tmp
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o install.yml
ansible-playbook install.yml

# Clean up
dnf clean all
