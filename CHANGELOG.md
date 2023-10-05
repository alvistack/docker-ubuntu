# Docker Image Packaging for Ubuntu

## YYYYMMDD.Y.Z - TBC

### Major Changes

-   Support Fedora 39
-   Support Ubuntu 23.10

## 20230914.1.1 - 2023-09-14

### Major Changes

-   Support Ansible community package 8.4.0
-   Support Ansible community package 8.3.0

## 20230724.1.2 - 2023-07-24

### Major Changes

-   Support Ansible community package 8.2.0
-   Remove Ubuntu 22.10 support

## 20230623.1.1 - 2023-06-23

### Major Changes

-   Support Ansible community package 8.1.0

## 20230617.1.1 - 2023-06-17

### Major Changes

-   Remove Ubuntu 18.04 support

## 20230512.1.1 - 2023-05-12

### Major Changes

-   Remove Fedora 36 support
-   Support Fedora 38

## 20230329.1.1 - 2023-03-29

### Major Changes

-   Support Ansible community package 7.4.0
-   Support Ubuntu 23.04

## 20230301.1.1 - 2023-03-01

### Major Changes

-   Support Ansible community package 7.3.0

## 20230201.1.1 - 2023-02-01

### Major Changes

-   Support Ansible community package 7.2.0

## 20221209.1.1 - 2022-12-09

### Major Changes

-   Support Ansible community package 7.1.0

## 20221126.1.1 - 2022-11-26

### Major Changes

-   Support Ansible community package 7.0.0

## 20221110.1.1 - 2022-11-10

### Major Changes

-   Support Ansible community package 6.6.0

## 20221014.1.1 - 2022-10-14

### Major Changes

-   Support Ansible community package 6.5.0
-   Support Ubuntu 22.10

## 20220915.1.1 - 2022-09-15

### Major Changes

-   Support Ansible community package 6.4.0

## 20220824.1.1 - 2022-08-24

### Major Changes

-   Support Ansible community package 6.3.0

## 20220803.1.1 - 2022-08-03

### Major Changes

-   Support Ansible community package 6.2.0

## 20220714.1.1 - 2022-07-14

### Major Changes

-   Support Ansible community package 6.1.0
-   Remove Ubuntu 21.10 support
-   Remove Ubuntu 21.04 support

## 20220622.1.1 - 2022-06-22

### Major Changes

-   Support Ansible community package 6.0.0

## 20220608.1.1 - 2022-06-08

### Major Changes

-   Support Ansible community package 5.9.0

## 20220520.1.1 - 2022-05-20

### Major Changes

-   Support Ansible community package 5.8.0
-   Remove Fedora 34 support

## 20220427.1.1 - 2022-04-27

### Major Changes

-   Rename Ansible Role with FQCN
-   Support Ansible community package 5.7.0
-   Support RHEL 9
-   Support CentOS 9 Stream
-   Support openSUSE Leap 15.4

## 20220407.1.2 - 2022-04-07

### Major Changes

-   Support Ansible community package 5.6.0
-   Support Fedora 36
-   Support Ubuntu 22.04
-   Support Ansible community package 5.5.0
-   Support Ansible community package 5.4.0

## 20220211.1.1 - 2022-02-11

### Major Changes

-   Remove Ubuntu 21.04 support
-   Skip package upgrade before running molecule

## 20211231.1.3 - 2021-12-31

### Major Changes

-   Support Fedora Rawhide
-   Support Debian Testing
-   Remove openSUSE Leap 15.2 support
-   Upgrade minimal Ansible community package support to 4.10

## 20211020.1.1 - 2021-10-20

### Major Changes

-   Remove Ubuntu 20.10 support
-   Support Ubuntu 21.10
-   Install dependencies with package manager
-   Upgrade minimal Ansible community package support to 4.7.0

## 20210718.1.1 - 2021-07-18

### Major Changes

-   Upgrade minimal Ansible community package support to 4.2.0

## 20210602.1.1 - 2021-06-02

### Major Changes

-   Initialize with `verify.yml` with first start
-   Upgrade minimal Ansible support to 4.0.0
-   Sync structure with `alvistack/vagrant-ubuntu`
-   Support Ubuntu 21.04

## 20210313.1.1 - 2021-03-13

### Major Changes

-   Bugfix [ansible-lint
    `namespace`](https://github.com/ansible-community/ansible-lint/pull/1451)
-   Bugfix [ansible-lint
    `no-handler`](https://github.com/ansible-community/ansible-lint/pull/1402)
-   Bugfix [ansible-lint
    `unnamed-task`](https://github.com/ansible-community/ansible-lint/pull/1413)
-   Change GIT tag as per Vagrant Box naming and versioning limitation

## 20.04.1-4alvistack13 - 2020-12-09

### Major Changes

-   Migrate from Travis CI to GitLab CI
-   Support Ubuntu 20.10
-   Revamp with Packer

## 20.04.1-4alvistack7 - 2020-10-14

### Major Changes

-   Refine Molecule matrix

## 20.04.1-4alvistack2 - 2020-08-26

### Major Changes

-   Upgrade minimal Ansible Lint support to 4.3.2
-   Install SQLite, MariaDB and PostgreSQL with Role
-   Upgrade Travis CI test as Ubuntu Focal based
-   Upgrade minimal Ansible support to 2.10.0
-   Remove Ubuntu 19.10 support

## 20.04-4alvistack4 - 2020-06-10

### Major Changes

-   Revamp `create`, `side_effect`, `verify` and `destroy` logic
-   Replace `tini` with `catatonit`
-   Rename `post_tasks.yml` as `side_effect.yml`
-   Add Ubuntu 20.04 support
-   Remove Ubuntu 16.04 support

## 18.04.4-4alvistack4 - 2020-03-05

### Major Changes

-   Revamp with Molecule and `docker commit`
-   Consolidate molecule tests into `default` (noop)
-   Hotfix for systemd
-   Replace `duplicity` with `restic`
-   Add Ubuntu 19.10 support

## 18.04.3-alvistack1 - 2020-01-15

### Major Changes

-   Replace `dumb-init` with `tini`, as like as `docker --init`
-   Replace `java` with `openjdk`
-   Replace `nodejs` with `node`
-   Include release specific vars and tasks

## 18.04.3-2alvistack3 - 2019-11-05

### Major Changes

-   Upgrade minimal Ansible support to 2.9.0
-   Upgrade Travis CI test as Ubuntu Bionic based
-   Default with Python 3
-   Hotfix for en_US.utf8 locale
-   Prepend executable if command starts with an option
-   Improve `ENTRYPOINT` and `CMD`

## 18.04.2-0alvistack8 - 2019-05-20

### Major Changes

-   Bugfix "Build times out because no output was received"
-   Upgrade minimal Ansible support to 2.8.0

## 18.04.2-0alvistack6 - 2019-04-15

### Major Changes

-   Porting to Molecule based
-   Add rclone support

## 18.04.1-0alvistack7 - 2018-12-06

### Major Changes

-   Add CVS, SVN, GIT, Mercurial and Perforce support
-   Replace Oracle Java JDK with OpenJDK
-   Upgrade Node.js version

## 18.04.1-0alvistack4 - 2018-11-20

### Major Changes

-   Deploy with roles in master branch
-   CI with ansible-lint
-   Add /root/.ssh/config
-   Set correct permission for /root/.ssh during bootup

## 18.04.1-0alvistack3 - 2018-11-09

### Major Changes

-   Skip container re-bootstrap in background during bootup
-   Preinstall with PHP, Node.js and Java

## 18.04.1-0alvistack1 - 2018-10-29

-   Ubuntu 16.04/18.04 based
-   Handle ENTRYPOINT with dumb-init
-   Handle `CMD` with SSHD
-   Self initialize with Ansible, by dogfooding with Ansible Playbook
