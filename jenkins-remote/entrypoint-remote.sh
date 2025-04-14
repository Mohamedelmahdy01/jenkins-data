#!/bin/bash

# Ensure correct permissions for SSH directory
mkdir -p /home/jenkins/.ssh
chmod 700 /home/jenkins/.ssh

# If an authorized_keys file is mounted, set correct permissions
if [ -f "/home/jenkins/.ssh/authorized_keys" ]; then
    chmod 600 /home/jenkins/.ssh/authorized_keys
    chown jenkins:jenkins /home/jenkins/.ssh/authorized_keys
fi

# Start SSH daemon
sudo /usr/sbin/sshd -D