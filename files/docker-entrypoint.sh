#!/bin/bash

set -o xtrace

# Bootstrap container in background
screen -dm bash -c "ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml && ansible-playbook /etc/ansible/playbooks/bootstrap.yml"

# Regenerate OpenSSH host keys
for type in dsa ecdsa ed25519 rsa; do
    yes y | ssh-keygen -N '' -t ${type} -f /etc/ssh/ssh_host_${type}_key
done

# Running sshd in foreground
exec sshd -eD
