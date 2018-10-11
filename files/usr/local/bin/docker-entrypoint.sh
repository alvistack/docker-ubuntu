#!/bin/bash

set -o xtrace

# Bootstrap container in background
screen -dm bash -c "ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml && ansible-playbook /etc/ansible/playbooks/bootstrap.yml"

# Regenerate OpenSSH host keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A

# Running sshd in foreground
exec /usr/sbin/sshd -eD
