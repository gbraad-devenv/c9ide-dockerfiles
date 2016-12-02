#!/bin/bash

# Doing this in a separate script lets us do it step by step while using a
# single docker layer.

# Install dependencies
dnf install -y \
    curl \
    wget \
    python2-dnf \
    ansible \
    tar \
    which \
    sudo \
    nss_wrapper \
    gettext

# Create user
adduser user -u 1000 -g 0 -r -m -d /home/user/ -c "Default Application User" -l
echo "user ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/user
chmod 0440 /etc/sudoers.d/user

# Ansible deployment
curl -sSL https://github.com/gbraad/ansible-playbooks/raw/master/playbooks/install-c9sdk.yml -o /tmp/install.yml
su - user -c "ansible-playbook /tmp/install.yml"

# Allow user installs in /opt as root
chgrp root /opt

# Create work directory
mkdir -p /workspace
chown user:root /workspace

# allow to run on openshift
chown -R user:root /opt/c9sdk
chmod -R g+rw /opt/c9sdk
chmod -R g+rw /home/user
find /home/user -type d -exec chmod g+x {} +

# Clean up
dnf clean all
rm /tmp/install.yml
