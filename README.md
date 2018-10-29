# Docker Image Packaging for Ubuntu

[![Travis](https://img.shields.io/travis/alvistack/docker-ubuntu.svg)](https://travis-ci.org/alvistack/docker-ubuntu)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/ubuntu.svg)](https://hub.docker.com/r/alvistack/ubuntu/)

Ubuntu is a free and open-source operating system and Linux distribution based on Debian.

Learn more about Ubuntu: <https://www.ubuntu.com/>

## Supported Tags and Respective `Dockerfile` Links

  - [`latest` (master/Dockerfile)](https://github.com/alvistack/docker-ubuntu/blob/master/Dockerfile)
  - [`18.04` (18.04/Dockerfile)](https://github.com/alvistack/docker-ubuntu/blob/18.04/Dockerfile)
  - [`16.04` (16.04/Dockerfile)](https://github.com/alvistack/docker-ubuntu/blob/16.04/Dockerfile)

## Overview

This Docker container makes it easy to get an instance of SSHD up and running with Ubuntu.

Based on [Official Ubuntu Docker Image](https://hub.docker.com/_/ubuntu/) with some minor hack:

  - Handle `ENTRYPOINT` with [dumb-init](https://github.com/Yelp/dumb-init)
  - Handle `CMD` with SSHD
  - Self initialize with Ansible, by dogfooding with Ansible Playbook

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/ubuntu
    
    # Run as detach
    docker run \
        -itd \
        --name ubuntu \
        --publish 2222:22 \
        alvistack/ubuntu

**Success**. SSHD is now available on port `2222`.

Because this container **DIDN'T** handle the generation of root password, so you should set it up manually with `pwgen` by:

    # Generate password with pwgen
    PASSWORD=$(docker exec -i ubuntu pwgen -cnyB1); echo $PASSWORD
    
    # Inject the generated password
    echo "root:$PASSWORD" | docker exec -i ubuntu chpasswd

Alternatively, you could inject your own SSH public key into container's authorized\_keys by:

    # Inject your own SSH public key
    (docker exec -i ubuntu sh -c "cat >> /root/.ssh/authorized_keys") < ~/.ssh/id_rsa.pub

Now you could SSH to it as normal:

    ssh root@localhost -p 2222

## Versioning

The `latest` tag matches the most recent version of this repository. Thus using `alvistack/ubuntu:latest` or `alvistack/ubuntu` will ensure you are running the most up to date version of this image.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
