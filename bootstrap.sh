#!/bin/bash

apt-get update
apt-get install -y build-essential libreadline-dev libssl-dev zlib1g-dev libxml2-dev libxslt-dev
apt-get install -y curl wget unzip vim git git-core tmux ruby libsqlite3-dev libmysqlclient-dev nodejs

su -c "source /vagrant/synced_folder/scripts/user-config.sh" vagrant
