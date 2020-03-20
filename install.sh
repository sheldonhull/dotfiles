#!/bin/bash
source lib.sh

awesome_header

bot "Customized environment"

bot "Copying settings.json"
ln -sf ~/.vscode/settings.json /User/settings.json
ln -sf ~/.vscode/keybindings.json /User/keybindings.json

bot "installing git-town"
sudo dpkg -i app/git-town-amd64.deb

bot "installing starship prompt"
RUN curl -fsSL https://starship.rs/install.sh | bash -s -- --force

bot "adding starship to default .bashrc"
echo "eval ""$(starship init bash)""" >> ~/.bashrc && source ~/.bashrc
bot "initializing"
starship init bash

RUN apt install curl -y
RUN echo "completed setup of starship.rs"

ok "finished with dotfiles"