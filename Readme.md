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
