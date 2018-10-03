# (c) Wong Hoi Sing Edison <hswong3i@pantarei-design.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM ubuntu:18.04

ENV LANG   "en_US.UTF8"
ENV LC_ALL "en_US.UTF8"
ENV SHELL  "/bin/bash"
ENV TZ     "UTC"

VOLUME  "/root"
WORKDIR "/root"

EXPOSE 22

ENTRYPOINT [ "dumb-init", "--" ]
CMD        [ "/usr/sbin/sshd", "-eD" ]

# Prepare APT depedencies
RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y curl git python-dev python-minimal \
    && rm -rf /var/lib/apt/lists/*

# Install PIP
RUN set -ex \
    && curl -sL https://bootstrap.pypa.io/get-pip.py | python

# Install dumb-init
RUN set -ex \
    && curl -skL https://github.com/Yelp/dumb-init/releases/download/v1.2.2/dumb-init_1.2.2_amd64 > /usr/local/bin/dumb-init \
    && chmod 0755 /usr/local/bin/dumb-init

# Copy files
COPY files /

# Initialize with Ansible
RUN set -ex \
    && pip install --upgrade --requirement /etc/ansible/requirements.txt \
    && ansible-galaxy install --force --role-file /etc/ansible/ansible-role-requirements.yml \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml
