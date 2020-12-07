# Docker Image Packaging for Ubuntu

[![Travis](https://img.shields.io/travis/com/alvistack/docker-ubuntu.svg)](https://travis-ci.com/alvistack/docker-ubuntu)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/ubuntu.svg)](https://hub.docker.com/r/alvistack/ubuntu/)

Ubuntu is a free and open-source operating system and Linux distribution based on Debian.

Learn more about Ubuntu: <https://www.ubuntu.com/>

## Supported Tags and Respective Packer Template Links

  - [`20.10`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-20.10/packer.json)
  - [`20.04`, `latest`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-20.04/packer.json)
  - [`18.04`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-18.04/packer.json)

## Overview

This Docker container makes it easy to get an instance of SSHD up and running with Ubuntu.

Based on [Official Ubuntu Docker Image](https://hub.docker.com/_/ubuntu/) with some minor hack:

  - Packaging by Packer Docker builder and Ansible provisioner in single layer
  - Handle `ENTRYPOINT` with [catatonit](https://github.com/openSUSE/catatonit)
  - Handle `CMD` with SSHD

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

### `alvistack/ubuntu:latest`

The `latest` tag matches the most recent [GitHub Release](https://github.com/alvistack/docker-ubuntu/releases) of this repository. Thus using `alvistack/ubuntu:latest` or `alvistack/ubuntu` will ensure you are running the most up to date stable version of this image.

### `alvistack/ubuntu:<version>`

The version tags are rolling release rebuild by [Travis](https://travis-ci.com/alvistack/docker-ubuntu) in weekly basis. Thus using these tags will ensure you are running the latest packages provided by the base image project.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
