# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.140.0/containers/codespaces-linux/.devcontainer/base.Dockerfile
FROM mcr.microsoft.com/vscode/devcontainers/universal:0-linux

USER root

# [Option] Install Docker CLI
ARG INSTALL_DOCKER="true"
COPY library-scripts/docker-debian.sh /tmp/library-scripts/
RUN if [ "${INSTALL_DOCKER}" = "true" ]; then \
        bash /tmp/library-scripts/docker-debian.sh "true" "/var/run/docker-host.sock" "/var/run/docker.sock" "codespace"; \
    else \
        echo '#!/bin/bash\nexec "$@"' > /usr/local/share/docker-init.sh && chmod +x /usr/local/share/docker-init.sh; \
    fi \
    && rm -rf /var/lib/apt/lists/* /tmp/library-scripts/

# ** [Optional] Uncomment this section to install additional packages. **
RUN apt-get -qqy update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -qqy install --no-install-recommends  python3-pip python3-dev python3-setuptools python3-apt \
    && $(which python3.8) -m pip install --upgrade pip \
    && CFLAGS=-Qunused-arguments CPPFLAGS=-Qunused-arguments pip3 install --user ansible
   # && curl https://raw.githubusercontent.com/neillturner/omnibus-ansible/master/ansible_install.sh | sudo bash \
    && apt-get clean \
    && rm -rf ~/.cache/pip/*

USER codespace
