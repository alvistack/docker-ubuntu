#!/bin/bash

set -o xtrace

# Regenerate OpenSSH host keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A

# Set correct permission for /root/.ssh
chmod 0700 /root/.ssh
chmod 0600 /root/.ssh/*

# Running sshd in foreground
exec /usr/sbin/sshd -eD
