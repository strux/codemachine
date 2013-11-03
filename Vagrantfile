# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # Rails dev
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # Sinatra dev
  config.vm.network :forwarded_port, guest: 4567, host: 4567

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  config.vm.provision :chef_solo do |chef|
    chef.data_bags_path = "data_bags"

    chef.add_recipe "apt"
    chef.add_recipe "git"
    chef.add_recipe "vim"
    chef.add_recipe "tmux"
    chef.add_recipe "solo-search"

    # setup users (from data_bags/users/*.json)
    chef.add_recipe "users::ruby_shadow" # necessary for password shadow support
    chef.add_recipe "users::sysadmins" # creates users and sysadmin group
    chef.add_recipe "users::sysadmin_sudo" # adds %sysadmin group to sudoers

    # homesick_agent and its dependencies
    chef.add_recipe "root_ssh_agent::ppid" # maintains agent during 'sudo su root'
    chef.add_recipe "ssh_known_hosts" # populates /etc/ssh/ssh_known_hosts from data_bags/ssh_known_hosts/*.json
    chef.add_recipe "homesick_agent::data_bag" # includes homesick::data_bag

    chef.add_recipe "dev-env"

    chef.json = {
      :users => ['strux']
    }

    # chef.log_level = :debug
  end
end
