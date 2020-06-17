#!/bin/usr/env bash


apt update -yq
apt install -qy pv wget

curl -s https://api.github.com/repos/GitTools/GitVersion/releases/latest \
| grep "browser_download_url.*gitversion\-debian.*\-x64.*\.tar\.gz" \
| cut -d ":" -f 2,3 \
| tr -d \" \
| wget -qi -

tarball="$(find . -name "gitversion-debian*.tar.gz")"
tar -xzf $tarball

chmod +x gitversion
./gitversion --version
mv gitversion ~/

# https://github.com/GitTools/GitVersion/releases/download/5.3.6/gitversion-debian.9-x64-5.3.6.tar.gz