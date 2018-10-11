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
CMD        [ "docker-entrypoint.sh" ]

# Prepare APT depedencies
RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install curl git python-dev python-minimal \
    && rm -rf /var/lib/apt/lists/*

# Install PIP
RUN set -ex \
    && curl -sL https://bootstrap.pypa.io/get-pip.py | python

# Install Ansible
RUN set -ex \
    && pip install --upgrade ansible \
    && rm -rf /root/.cache/pip

# Copy files
COPY files /

# Bootstrap with Ansible
RUN set -ex \
    && ansible-galaxy install --force --roles-path /etc/ansible/roles --role-file /etc/ansible/ansible-role-requirements.yml \
    && ansible-playbook /etc/ansible/playbooks/bootstrap.yml
