# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

user = ENV['USER']

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "chef/debian-7.4"
  config.vm.provision :shell, path: "bootstrap.sh"
  config.vm.network :forwarded_port, host: 1280, guest: 80
  config.vm.synced_folder "/Users/"+user+"/www/", "/home/vagrant/www"
  config.vm.synced_folder "/Users/"+user+"/vagrant/share/", "/home/vagrant/share/"
  config.vm.synced_folder "/Users/"+user+"/vagrant/confs/", "/home/vagrant/confs/"
end
