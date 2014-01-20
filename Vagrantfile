# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  config.vm.box = "official-precise-32"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-i386-vagrant-disk1.box"
  config.vm.provision :shell, path: "provision-root.sh"
  config.vm.provision :shell, path: "provision-user.sh", privileged: false
  config.vm.network :forwarded_port, guest: 3000, host: 3000
end
