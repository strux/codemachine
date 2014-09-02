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
