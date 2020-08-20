#!/usr/bin/env bash

echo "Should not run this from root, but change to USER codespace or equivalent"
bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" \
    && echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >> /home/codespace/.profile \
    && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
