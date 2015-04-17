#!/bin/bash

# Add mongodb packages
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list

apt-get update
apt-get install -y build-essential libreadline-dev libssl-dev zlib1g-dev libxml2-dev libyaml-dev libxslt-dev redis-server mongodb-10gen=2.4.11
apt-get install -y curl jshon wget unzip vim vim-nox git git-core tmux ruby libsqlite3-dev libmysqlclient-dev nodejs libpq-dev postgresql postgresql-contrib

# Phantomjs
apt-get install libfontconfig1-dev
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-i686.tar.bz2
tar -xf phantomjs-1.9.8-linux-i686.tar.bz2
cp phantomjs-1.9.8-linux-i686/bin/phantomjs /usr/local/bin/
chmod +x /usr/local/bin/phantomjs
rm -rf phantomjs*

su -c "source /vagrant/synced_folder/scripts/user-config.sh" vagrant

# Force rails server to run on public interface (not completely sure of consequences here)
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/hosts

# Add vagrant user to postgres
sudo -u postgres createuser -d vagrant
