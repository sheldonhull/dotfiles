#!/bin/bash


echo "Customized environment"

echo "Copying settings.json"
ln -sf ~/.vscode/settings.json ~/.config/Code/User/settings.json
ln -sf ~/.vscode/keybindings.json ~/.config/Code/User/keybindings.json

echo "installing git-town"
dpkg -i app/git-town-amd64.deb
