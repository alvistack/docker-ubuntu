#!/bin/bash

set -o xtrace

screen -dm bash -c "ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml && ansible-playbook /etc/ansible/playbooks/bootstrap.yml"

sshd -eD
