FROM mcr.microsoft.com/vscode/devcontainers/universal:linux
ARG BUILD_FORCE=1
LABEL Name=chezmoi-test Version=0.0.1
WORKDIR /home/codespace
USER root
# RUN sh -c "$(wget -qO- git.io/chezmoi)" && chmod a+x ./bin/chezmoi && mv ./bin/chezmoi /usr/local/bin/chezmoi && rm -rf ./bin
USER codespace
COPY . /home/codespace/.local/share/chezmoi

RUN echo "My Current directory: $(pwd)" \
    && sh -c "$(wget -qO- git.io/chezmoi)" && sudo chmod a+x ./bin/chezmoi && sudo mv ./bin/chezmoi /usr/local/bin/chezmoi && rm -rf ./bin \
    && echo "BUILD_FORCE=${BUILD_FORCE}" \
    && git config --global init.defaultBranch main \
    && sudo /usr/local/bin/chezmoi init --force --verbose
# USER root
# RUN sh -c "$(wget -qO- git.io/chezmoi)" && chmod +x ./bin/chezmoi && mv ./bin/chezmoi /usr/local/bin/chezmoi && rm -rf ./bin
# USER codespace
#CMD sudo chezmoi init --apply --verbose git@github.com:sheldonhull/chezmoi.git
#ENTRYPOINT sudo chezmoi init --apply --verbose git@github.com:sheldonhull/chezmoi.git
# ENTRYPOINT [ "bash","/usr/local/bin/chezmoi" ]
# ENTRYPOINT [
#     "chezmoi init --apply --verbose git@github.com:sheldonhull/chezmoi.git"
# ]

# Diagnose: ssh -vT git@github.com
# RUN sudo ./bin/chezmoi apply --force --verbose \
#     && sudo ./bin/chezmoi verify --force --verbose

# Diagnose: ssh -vT git@github.com
