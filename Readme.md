## Prerequisits ##

Install VirtualBox
https://www.virtualbox.org/wiki/Downloads

Install vagrant
https://www.vagrantup.com/downloads

## Running the environment ##

```
git clone git@github.com:strux/dev-env.git
cd dev-env

# First time only
vagrant box add hashicorp/precise32

vagrant up
vagrant ssh
```

## Solarized ##
If you'd like to have terminal vim play nice with solarized on OS X Terminal.app I highly recommend using the Terminal.app theme found here: 
https://github.com/tomislav/osx-terminal.app-colors-solarized
