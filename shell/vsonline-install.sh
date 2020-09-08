#!/usr/bin/env bash

source lib.sh

awesome_header

bot "Customized environment"
bot "initialing powershell default profile settings"
sudo pwsh ./init.ps1

bot "Installing custom apt packages"
sudo apt -qqy install curl wget pv


sudo bash ./install-gitversion.sh

sudo install-fetch.sh
sudo install-precommit.sh
sudo install-linuxbrew.sh
sudo install-gittown.sh

sudo install-starship.sh
bot "adding starship to default .bashrc"
echo "eval ""$(starship init bash)""" >> ~/.bashrc && source ~/.bashrc
bot "initializing"
starship init bash
sudo apt install curl wget tree -y
echo "completed setup of starship.rs"

echo "installing fonts"
curl -L https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true --output "src/glyphs/JetBrainsMono NF.ttf"

#bot "Installing Linuxbrew, but not with sudo as it complains vigorously about this"
# bot "Please note that this does take a while on a build, but benefits with easier extra tool installs such as 'brew install tfenv'"
# bash ./install-linuxbrew.sh

ok "finished with dotfiles"
