#!/usr/bin/env bash

sudo apt-get -qqy  install python-pip python-dev build-essential && apt-get -qqy install python3-pip python3-dev build-essential python3-setuptools \
    && pip3 install cfn_flip
