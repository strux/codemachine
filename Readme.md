# Codemachine #

Codemachine is a Vagrant configured VM that is 100% ready and optimized for ruby/web development.
![Codemachine Screenshot](https://raw.githubusercontent.com/strux/codemachine/master/assets/Screen%20Shot%202014-09-04%20at%2010.43.49%20AM.png)

Some notable out-of-the-box (pun) features include:

1. spf-13 Ultimate Vim distribution
1. tmux
1. Custom hjkl tab/window bindings for vim and tmux
1. Solarized theme configured for vim and OS X Terminal.app
1. Common ruby version installed with rbenv
1. git installed with helpful defaults
1. Git branch shown in prompt (git-prompt.sh)
1. hub installed with tab completion and git alias
1. Port forwarding for common dev ports (3000,3030,4567,etc)
1. Javascript runtime (nodejs)
1. Common build tools installed
1. Custom prompt so you don't forget where you are
1. Interactive script to collect profile information
1. lots more...

## Prerequisites ##

### Virtualization ###
Install VirtualBox
https://www.virtualbox.org/wiki/Downloads

Install Vagrant
https://www.vagrantup.com/downloads

### Appearance (Solarized) ###
If you're on OSX using Terminal.app and you'd like to have things look like the screenshot you'll need to use the Terminal.app theme found here:

https://github.com/tomislav/osx-terminal.app-colors-solarized

The offical one from the Solarized team does not work nearly as well.
If you manage to get things looking good on other OS/terminal combinations please report back here.

## Setting things up ##

```
git clone git@github.com:strux/codemachine.git
cd codemachine

vagrant up
```

## Running the environment ##

```
# Bring your ssh keys along for the ride
ssh-add ~/.ssh/id_dsa # or id_rsa

vagrant ssh
cd code/
git clone git@github.com:you/your_awesome_project.git
tmux new-session ...
# start developing
```
