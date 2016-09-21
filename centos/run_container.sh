#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
yum install -y epel-release
yum install -y \
    curl \
    ansible \
    tar \
    which \
    sudo

# Ansible deployment
cd /tmp
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o install.yml

# Create user
adduser user
echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user

# Ansible deployment
## Remove requiretty
sed -i 's/Defaults    requiretty/Defaults    !requiretty/g' /etc/sudoers
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o /tmp/install.yml
su - user -c "ansible-playbook /tmp/install.yml"
## Reset the requiretty
sed -i 's/Defaults    !requiretty/Defaults    requiretty/g' /etc/sudoers

# Create work directory
mkdir -p /workspace
chown user:user /workspace

# Clean up
yum clean all
rm /tmp/install.yml
