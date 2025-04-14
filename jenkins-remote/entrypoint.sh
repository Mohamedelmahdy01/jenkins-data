#!/bin/bash

# Make sure the SSH folder exists
mkdir -p /var/jenkins_home/.ssh

# Create an SSH key if it doesn't already exist.
if [ ! -f "/var/jenkins_home/.ssh/id_rsa" ]; then
    ssh-keygen -t rsa -b 4096 -f /var/jenkins_home/.ssh/id_rsa -N ""
    chmod 700 /var/jenkins_home/.ssh
    chmod 600 /var/jenkins_home/.ssh/id_rsa
    chmod 644 /var/jenkins_home/.ssh/id_rsa.pub

    # Print public key
    echo "SSH Public Key:"
    cat /var/jenkins_home/.ssh/id_rsa.pub

    # Get public key
    PUBLIC_KEY=$(cat /var/jenkins_home/.ssh/id_rsa.pub)

    # Add the key to the authorized keys file on the remote host
    # Use sshpass to handle password authentication
    sshpass -p password ssh -o StrictHostKeyChecking=no jenkins@remote-host "mkdir -p /home/jenkins/.ssh && echo '$PUBLIC_KEY' >> /home/jenkins/.ssh/authorized_keys"

fi

# start jenkins
exec /usr/bin/tini -s -- /usr/local/bin/jenkins.sh