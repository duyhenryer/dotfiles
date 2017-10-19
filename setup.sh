#!/bin/bash

# Ask for the administrator password upfront
sudo -v

import DOTFILES = 'pwd'

if [ -z "`cat ~/.bashrc | grep '.bash_profile'`" ]; then
  echo "source ~/.bash_profile;" >> ~/.bashrc;
fi

if [ -z "`cat ~/.bash_profile | grep '/dotfiles'`" ]; then
  echo "source `pwd`/.spread" >> ~/.bash_profile;
fi

cp /fonts/ ~/.fonts/


