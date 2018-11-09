#!/bin/bash

set -o xtrace

# Regenerate OpenSSH host keys
rm -rf /etc/ssh/ssh_host_*
ssh-keygen -A

# Running sshd in foreground
exec /usr/sbin/sshd -eD
