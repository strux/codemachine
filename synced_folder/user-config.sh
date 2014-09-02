#!/bin/bash

# TODO:
# remove hard coded user.name in favor of prompting script
# clone top 5 repos

set -x

# Dot files
for f in ~/synced_folder/.*; do [ -f $f ] && ln -s $f ~/$(basename $f); done

# Dev area
mkdir ~/development

# Git config
git config --global core.editor vim
git config --global color.diff auto
git config --global color.status auto
git config --global color.branch auto
git config --global color.status.changed yellow
git config --global color.status.added green
git config --global color.status.untracked red

# rbenv
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.provisioned_bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.provisioned_bash_profile
mkdir ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
source ~/.provisioned_bash_profile

# Install common rubies
rbenv install 1.9.3-p547
rbenv install 2.1.2
rbenv rehash

# Set default ruby
rbenv global 2.1.2

# Hub
git clone git://github.com/github/hub.git
cd hub
sudo rake install
cd ..
rm -rf hub

# Skip gem documentation
echo "install: --no-ri --no-rdoc" >> ~/.gemrc
echo "update: --no-ri --no-rdoc" >> ~/.gemrc

# Stackato
stackato_version=3.1.1
stackato_file=stackato-${stackato_version}-linux-glibc2.3-ix86
wget http://downloads.activestate.com/stackato/client/v${stackato_version}/${stackato_file}.zip
unzip ${stackato_file}.zip
sudo cp ${stackato_file}/stackato /usr/local/bin/
rm -rf stackato*

# spf-13
curl http://j.mp/spf13-vim3 -L -o - | sh
