#!/bin/bash

set -o xtrace

# Prepend executable if command starts with an option
if [ "${1:0:1}" = '-' ]; then
    set -- /usr/sbin/sshd "$@"
fi

if [ "$1" = '/usr/sbin/sshd' ]; then
    # Regenerate OpenSSH host keys
    rm -rf /etc/ssh/ssh_host_*
    ssh-keygen -A

    # Set correct permission for /root
    chown -Rf root:root /root
    chmod 0700 /root/.ssh
    chmod 0600 /root/.ssh/*
fi

exec "$@"
