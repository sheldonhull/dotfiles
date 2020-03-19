#!/bin/bash
source lib.sh

awesome_header

bot "Customized environment"

bot "Copying settings.json"
ln -sf ~/.vscode/settings.json /User/settings.json
ln -sf ~/.vscode/keybindings.json /User/keybindings.json

bot "installing git-town"
sudo dpkg -i app/git-town-amd64.deb


ok "finished with dotfiles"