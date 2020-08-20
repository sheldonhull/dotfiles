#!/usr/bin/env bash


sudo apt -yqq update
sudo apt -yqqq install pv wget

curl -s https://api.github.com/repos/syncromatics/gogitver/releases/latest | pv -q -L 9600 \
| grep "browser_download_url.*linux.tar.gz" \
| cut -d ":" -f 2,3 \
| tr -d \" \
| wget -qi -


tarball="$(find . -name "*linux.tar.gz")"
sudo chmod +x $tarball
extract=$(tar -xzf $tarball  | pv)
sudo chmod +x gogitver
sudo mv gogitver /usr/local/bin/ | pv
echo $extract was the result of extraction
sudo chmod +x /usr/local/bin/gogitver
echo "downloaded $tarball"
sudo rm $tarball
#echo ">>>> gitversion version: $(gitversion /version)"

# https://github.com/GitTools/GitVersion/releases/download/5.3.6/gitversion-alpine.9-x64-5.3.6.tar.gz