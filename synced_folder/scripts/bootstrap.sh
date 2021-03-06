#!/bin/bash

apt-get update
apt-get install -y build-essential libreadline-dev libssl-dev zlib1g-dev libxml2-dev libyaml-dev libxslt-dev redis-server htop
apt-get install -y curl jshon wget unzip vim vim-nox silversearcher-ag git git-core tmux ruby libsqlite3-dev libmysqlclient-dev nodejs libpq-dev postgresql postgresql-contrib

################################################################################
# Phantomjs
################################################################################
apt-get install libfontconfig1-dev libfontconfig
wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.8-linux-x86_64.tar.bz2
tar -xf phantomjs-1.9.8-linux-x86_64.tar.bz2
cp phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin/
chmod +x /usr/local/bin/phantomjs
rm -rf phantomjs*

################################################################################
# Hub
################################################################################
wget https://github.com/github/hub/releases/download/v2.2.1/hub-linux-386-2.2.1.tar.gz
tar -xf hub-linux-386-2.2.1.tar.gz
cp hub-linux-386-2.2.1/hub /usr/local/bin/
chmod +x /usr/local/bin/hub
rm -rf hub*

################################################################################
# Stackato
################################################################################
stackato_version=3.2.0
stackato_file=stackato-${stackato_version}-linux-glibc2.3-x86_64
wget http://downloads.activestate.com/stackato/client/v${stackato_version}/${stackato_file}.zip
unzip ${stackato_file}.zip
sudo cp ${stackato_file}/stackato /usr/local/bin/
rm -rf stackato*


################################################################################
# Force rails server to run on public interface (not completely sure of consequences here)
################################################################################
sudo sed -i 's/127.0.0.1/0.0.0.0/g' /etc/hosts

################################################################################
# Add vagrant user to postgres
################################################################################
sudo -u postgres createuser -d vagrant

################################################################################
# Run user config script
################################################################################
su -c "source /vagrant/synced_folder/scripts/user-config.sh" vagrant
