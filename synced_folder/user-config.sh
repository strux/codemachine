#!/bin/bash

# TODO:
# hub
# make prompt RED
# git auto-complete
# dotfiles

set -x

# Git config
#ssh-keygen -t rsa -C "ben@carnivorous.org"
#ssh -T git@github.com
git config --global user.name "strux"
git config --global user.email ben@carnivorous.org
git config --global core.editor vim
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.status.changed yellow
git config --global color.status.added green
git config --global color.status.untracked red

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
#exec $SHELL

mkdir ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
#exec $SHELL

source ~/.bash_profile

# Install common rubies
rbenv install 1.9.3-p547
rbenv install 2.1.2
rbenv rehash

# Set global ruby
rbenv global 2.1.2

# Skip gem documentation
echo "install: --no-ri --no-rdoc" >> ~/.gemrc
echo "update: --no-ri --no-rdoc" >> ~/.gemrc

# spf-13
# curl http://j.mp/spf13-vim3 -L -o - | sh
