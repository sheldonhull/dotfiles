#!/usr/bin/env bash
awesome_header
source lib.sh


full_path=$(realpath $0)
bot "full_path: $full_path"


dir_path=$(dirname $full_path)
bot "dir_path: $dir_path"

project_root=$(dirname $(dirname $(realpath $0 )))
bot "project_root: $project_root"

bot "Customized environment"
bot "initialing powershell default profile settings"
sudo pwsh $dir_path/init.ps1

bot "Installing custom apt packages"
sudo apt -qqy install curl wget pv

bot "Installing: gitversion"
sudo bash $dir_path/install-gitversion.sh

bot "Installing: fetch"
sudo install-fetch.sh

bot "Installing: precommit"
sudo install-precommit.sh

bot "Installing: linuxbrew"
sudo install-linuxbrew.sh

bot "Installing: gittown"
sudo install-gittown.sh

bot "Installing: starship"
sudo install-starship.sh

bot "adding starship to default profiles. This will be replaced eventually with chezmoi apply"
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc && source ~/.bashrc
echo "eval \"\$(starship init zsh)\"" >> ~/.zshrc
echo "starship init fish | source"  >> ~/.config/fish/config.fish


#echo "installing fonts"
#curl -L "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf?raw=true" --output "src/glyphs/JetBrainsMono NF.ttf"

#bot "Installing Linuxbrew, but not with sudo as it complains vigorously about this"
# bot "Please note that this does take a while on a build, but benefits with easier extra tool installs such as 'brew install tfenv'"
# bash ./install-linuxbrew.sh

ok "finished with dotfiles"
