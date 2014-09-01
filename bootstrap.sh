#!/bin/bash

apt-get update
apt-get install -y build-essential libreadline-dev libssl-dev zlib1g-dev libxml2-dev libxslt-dev
apt-get install -y curl git git-core vim tmux ruby

su -c "source /vagrant/synced_folder/user-config.sh" vagrant
