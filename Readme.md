# Codemachine #

Codemachine is a Vagrant VM that is fully configured for (ruby/web) development.  Some notable out-of-the-box features include:

1. spf-13 Ultimate Vim distribution
1. tmux
1. Custom hjkl tab/window bindings for vim and tmux
1. Solarized theme configured for vim and OS X Terminal.app
1. Common ruby version installed with rbenv
1. git installed with helpful defaults
1. hub installed with tab completion and git alias
1. Port forwarding for common dev ports (3000,3030,4567,etc)
1. Javascript runtime (nodejs)
1. Common build tools installed
1. Custom prompt to remind you your in a VM
1. Interactive script to collect profile information
1. lots more...

## Prerequisites ##

Install VirtualBox
https://www.virtualbox.org/wiki/Downloads

Install Vagrant
https://www.vagrantup.com/downloads

## Running the environment ##

```
git clone git@github.com:strux/codemachine.git
cd codemachine

# Bring your ssh keys along for the ride
ssh-add ~/.ssh/id_dsa # or id_rsa

vagrant up
vagrant ssh
```

## Solarized ##
If you'd like to have terminal vim play nice with solarized on OS X Terminal.app I highly recommend using the Terminal.app theme found here: 
https://github.com/tomislav/osx-terminal.app-colors-solarized
