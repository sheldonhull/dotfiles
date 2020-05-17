#!/usr/bin/env bash -e
# Original Sourced from: https://github.com/dude051/macbook-bootstrap
# Sets up requirements to provision with ansible
#

#
# Clean display function
#
# usage:
#        display "My thing to output"
#
function display() {
    echo "----> $1"
}

if $(xcode-select --install 1>/dev/null 2>&1);
then
  exit 1
fi

if [ ! $(which pip) ]
then
    sudo easy_install pip
fi

sudo pip install --upgrade pip

display "Installing Ansible"
sudo pip install --upgrade ansible boto

# vim: ft=sh:
