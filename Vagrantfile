# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "hashicorp/precise32"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.synced_folder 'synced_folder', '/home/vagrant/synced_folder'

  config.vm.provider "virtualbox" do |v|
    v.memory = 1536
    v.cpus = 2
    v.customize ["modifyvm", :id, "--cpuexecutioncap", "60"]
  end
end
