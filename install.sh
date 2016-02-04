#!/bin/bash

echo 'Getting your system ready to roar...'

dir="$HOME/Documents/repos"
mkdir -p $dir
cd "$dir"
git clone --recursive git://github.com/thenitai/dotfiles.git
cd dotfiles
sudo bash setup.sh

