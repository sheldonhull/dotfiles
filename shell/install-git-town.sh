#!/usr/bin/env bash
curl -s https://api.github.com/repos/git-town/git-town/releases/latest \
  | grep "git-town" \
  | grep amd64.deb \
  | cut -d '"' -f 4 \
  | wget -qi -

sudo dpkg -i git-town-amd64.deb
rm git-town-amd64.deb