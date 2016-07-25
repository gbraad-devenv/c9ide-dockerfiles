#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
yum remove -y vim-minimal
yum install -y \
    tar \
    which \
    git \
    ansible \
    python-pip \
    python2-dnf

# Ansible deployment
sed -i 's/Defaults    requiretty/Defaults    !requiretty/g' /etc/sudoers
cd /tmp
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o install.yml
ansible-playbook install.yml

# Clean up
sed -i 's/Defaults    !requiretty/Defaults    requiretty/g' /etc/sudoers
yum clean all
