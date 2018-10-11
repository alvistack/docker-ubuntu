#!/bin/bash

set -o xtrace

# Bootstrap container in background
screen -dm bash -c "set -ex \
    && ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml \
    && yamllint --config-file /etc/ansible/.yamllint /etc/ansible \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --syntax-check \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --diff \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml --diff"

# Regenerate OpenSSH host keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A

# Running sshd in foreground
exec /usr/sbin/sshd -eD
