# dev-env-a-box #

dev-env-a-box is a Vagrant VM that is fully configured for (ruby/web) development.  Some notable out-of-the-box features include:
# spf-13 Ultimate Vim distribution
# tmux
# Custom hjkl tab/window bindings for vim and tmux
# Solarized theme configured for vim and OS X Terminal.app
# Common ruby version installed with rbenv
# git installed with helpful defaults
# hub installed with tab completion and git alias
# Port forwarding for common dev ports (3000,3030,4567,etc)
# Javascript runtime (nodejs)
# Common build tools installed
# lots more...

## Prerequisites ##

Install VirtualBox
https://www.virtualbox.org/wiki/Downloads

Install Vagrant
https://www.vagrantup.com/downloads

## Running the environment ##

```
git clone git@github.com:strux/dev-env.git
cd dev-env

# Bring your ssh keys along for the ride
ssh-add ~/.ssh/id_dsa
# or maybe
# ssh-add ~/.ssh/id_rsa

vagrant up
vagrant ssh
```

## Solarized ##
If you'd like to have terminal vim play nice with solarized on OS X Terminal.app I highly recommend using the Terminal.app theme found here: 
https://github.com/tomislav/osx-terminal.app-colors-solarized
