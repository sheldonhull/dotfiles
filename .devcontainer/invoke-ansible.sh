#!/usr/bin/env bash
export ANSIBLE_CONFIG=./ansible/config/ansible.cfg
export ANSIBLE_PYTHON_INTERPRETER=$(which python3.8)
echo "Current: $(ansible --version)"
ansible-galaxy install nioniosfr.github_release
ansible-galaxy install markosamuli.linuxbrew
ansible-galaxy install ./ansible/requirements.yml --ignore-errors
ansible-playbook ./ansible/main.yml -e "ANSIBLE_PYTHON_INTERPRETER=$ANSIBLE_PYTHON_INTERPRETER"
