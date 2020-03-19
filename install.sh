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
curl -fsSL https://starship.rs/install.sh | bash
bot "adding starship to default .bashrc"
echo "eval ""$(starship init bash)""" >> ~/.bashrc && source ~/.bashrc
bot "initializing"
starship init bash

ok "finished with dotfiles"