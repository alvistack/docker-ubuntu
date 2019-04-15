# Docker Image Packaging for Ubuntu

## 18.04.2-0alvistackx - TBC

### Major Changes

## 18.04.2-0alvistack6 - 2019-04-15

### Major Changes

  - Porting to Molecule based
  - Add rclone support

## 18.04.1-0alvistack7 - 2018-12-06

### Major Changes

  - Add CVS, SVN, GIT, Mercurial and Perforce support
  - Replace Oracle Java JDK with OpenJDK
  - Upgrade Node.js version

## 18.04.1-0alvistack4 - 2018-11-20

### Major Changes

  - Deploy with roles in master branch
  - CI with ansible-lint
  - Add /root/.ssh/config
  - Set correct permission for /root/.ssh during bootup

## 18.04.1-0alvistack3 - 2018-11-09

### Major Changes

  - Skip container re-bootstrap in background during bootup
  - Preinstall with PHP, Node.js and Java

## 18.04.1-0alvistack1 - 2018-10-29

  - Ubuntu 16.04/18.04 based
  - Handle ENTRYPOINT with dumb-init
  - Handle `CMD` with SSHD
  - Self initialize with Ansible, by dogfooding with Ansible Playbook
