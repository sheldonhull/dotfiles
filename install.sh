#!/bin/bash


echo "Customized environment"

echo "Copying settings.json"
ln -sf ~/.vscode/settings.json /User/settings.json
ln -sf ~/.vscode/keybindings.json /User/keybindings.json

echo "installing git-town"
sudo dpkg -i app/git-town-amd64.deb
