#!/bin/bash

set -x

################################################################################
# Dot files
################################################################################
for f in ~/synced_folder/global_config/.*; do [ -f $f ] && ln -s $f ~/$(basename $f); done

################################################################################
# Persisted directories
################################################################################
for f in ~/synced_folder/local_config/*; do [ -d $f ] && ln -s $f ~/$(basename $f); done

################################################################################
# Code directory
################################################################################
ln -s ~/synced_folder/local_config/code ~/code

################################################################################
# Auto completion
################################################################################
git_completion=https://raw.githubusercontent.com/git/git/master/contrib/completion/
wget -O ~/.git-completion.bash ${git_completion}git-completion.bash
wget -O ~/.git-prompt.sh ${git_completion}git-prompt.sh
hub_completion=https://raw.githubusercontent.com/github/hub/master/etc/
wget -O ~/.hub.bash_completion.sh ${hub_completion}hub.bash_completion.sh

################################################################################
# rbenv
################################################################################
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
mkdir ~/.rbenv/plugins
git clone git://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

################################################################################
# Install common rubies
################################################################################
for ruby in 1.9.3-p547 2.1.5
do
  rbenv install ${ruby}
  rbenv rehash
  rbenv global ${ruby}
  # Bundler
  gem install bundler
  gem install rake
  gem install debugger-ruby_core_source
  gem install tmuxinator  -v 0.6.9
  rbenv rehash
done

################################################################################
# Cleanup output
################################################################################
set +x

################################################################################
# VIm 
################################################################################
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir ~/.vim/backup/ ~/.vim/swap/ ~/.vim/undo/
vim +PluginInstall +qall

################################################################################
# Next Steps
################################################################################
echo "################################################################################"
echo "# Finished!"
echo "# Next steps:"
echo "# $ tput reset"
echo "# $ vagrant ssh"
echo "# $ cd code/"
echo "# $ git clone git@github.com:you/your_awesome_project.git"
echo "# $ tmux new-session ..."
echo "# start developing"
echo "#"
echo "# Good luck!"
echo "################################################################################"
