# Docker Image Packaging for Ubuntu

<img src="/alvistack.svg" width="75" alt="AlviStack">

[![GitLab pipeline status](https://img.shields.io/gitlab/pipeline/alvistack/docker-ubuntu/master)](https://gitlab.com/alvistack/docker-ubuntu/-/pipelines)
[![GitHub release](https://img.shields.io/github/release/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/releases)
[![GitHub license](https://img.shields.io/github/license/alvistack/docker-ubuntu.svg)](https://github.com/alvistack/docker-ubuntu/blob/master/LICENSE)
[![Docker Pulls](https://img.shields.io/docker/pulls/alvistack/ubuntu-20.04.svg)](https://hub.docker.com/r/alvistack/ubuntu-20.04)

Ubuntu is a Debian-based Linux operating system that runs from the desktop to the cloud, to all your internet connected things. It is the world's most popular operating system across public clouds and OpenStack clouds. It is the number one platform for containers; from Docker to Kubernetes to LXD, Ubuntu can run your containers at scale. Fast, secure and simple, Ubuntu powers millions of PCs worldwide.

Learn more about Ubuntu: <https://ubuntu.com/>

## Supported Tags and Respective Packer Template Links

  - [`alvistack/ubuntu-21.04`](https://hub.docker.com/r/alvistack/ubuntu-21.04)
      - [`packer/docker-21.04/packer.json`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-21.04/packer.json)
  - [`alvistack/ubuntu-20.10`](https://hub.docker.com/r/alvistack/ubuntu-20.10)
      - [`packer/docker-20.10/packer.json`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-20.10/packer.json)
  - [`alvistack/ubuntu-20.04`](https://hub.docker.com/r/alvistack/ubuntu-20.04)
      - [`packer/docker-20.04/packer.json`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-20.04/packer.json)
  - [`alvistack/ubuntu-18.04`](https://hub.docker.com/r/alvistack/ubuntu-18.04)
      - [`packer/docker-18.04/packer.json`](https://github.com/alvistack/docker-ubuntu/blob/master/packer/docker-18.04/packer.json)

## Overview

This Docker container makes it easy to get an instance of SSHD up and running with Ubuntu.

Based on [Official Ubuntu Docker Image](https://hub.docker.com/_/ubuntu/) with some minor hack:

  - Packaging by Packer Docker builder and Ansible provisioner in single layer
  - Handle `ENTRYPOINT` with [catatonit](https://github.com/openSUSE/catatonit)
  - Handle `CMD` with SSHD

### Quick Start

Start SSHD:

    # Pull latest image
    docker pull alvistack/ubuntu-20.04
    
    # Run as detach
    docker run \
        -itd \
        --name ubuntu \
        --publish 2222:22 \
        alvistack/ubuntu-20.04

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

### `YYYYMMDD.Y.Z`

Release tags could be find from [GitHub Release](https://github.com/alvistack/docker-ubuntu/releases) of this repository. Thus using these tags will ensure you are running the most up to date stable version of this image.

### `YYYYMMDD.0.0`

Version tags ended with `.0.0` are rolling release rebuild by [GitLab pipeline](https://gitlab.com/alvistack/docker-ubuntu/-/pipelines) in weekly basis. Thus using these tags will ensure you are running the latest packages provided by the base image project.

## License

  - Code released under [Apache License 2.0](LICENSE)
  - Docs released under [CC BY 4.0](http://creativecommons.org/licenses/by/4.0/)

## Author Information

  - Wong Hoi Sing Edison
      - <https://twitter.com/hswong3i>
      - <https://github.com/hswong3i>
