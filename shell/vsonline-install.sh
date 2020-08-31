#!/usr/bin/env bash

source lib.sh

awesome_header

bot "Customized environment"

# bot "Copying settings.json"
# ln -sf ~/.vscode/settings.json /User/settings.json
# ln -sf ~/.vscode/keybindings.json /User/keybindings.json

# bot "installing git-town"
# sudo dpkg -i ../linux/app/git-town-amd64.deb

# bot "installing starship prompt"
# curl -fsSL https://starship.rs/install.sh | bash -s -- --force

bot "adding starship to default .bashrc"
echo "eval ""$(starship init bash)""" >> ~/.bashrc && source ~/.bashrc
bot "initializing"
starship init bash

sudo apt install curl -y
echo "completed setup of starship.rs"

echo "installing fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true --output "src/glyphs/JetBrainsMono NF.ttf"


bot "initialing powershell default profile settings"

sudo pwsh ./init.ps1

bot "starting install of git town"
sudo bash ./install-git-town.sh
bot "starting install of gitversion"
sudo bash ./install-gitversion.sh
bot "Starting Python Precommit framework install"
bash ./install-precommit.sh

bot "Installing Linuxbrew, but not with sudo as it complains vigorously about this"
bot "Please note that this does take a while on a build, but benefits with easier extra tool installs such as 'brew install tfenv'"
bash ./install-linuxbrew.sh

ok "finished with dotfiles"
