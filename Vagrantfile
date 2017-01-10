# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|
  # Base box
  config.vm.box = "ubuntu/xenial32"
  # RailsBridge provisioning config
  config.vm.provision :file, source: "provision-files", destination: "/tmp/provision-files"
  config.vm.provision :shell, path: "provision-root-install.sh"
  config.vm.provision :shell, path: "https://toolbelt.heroku.com/install-ubuntu.sh"
  config.vm.provision :shell, path: "provision-user-install.sh", privileged: false
  config.vm.provision :shell, path: "provision-root-cleanup.sh"
  # Enable forwarded port while we're developing and testing this box
  config.vm.network :forwarded_port, guest: 3000, host: 3000
  # Work around the official image hardcoding our current pwd (introduced here:)
  # http://bazaar.launchpad.net/~ubuntu-core-dev/livecd-rootfs/trunk/revision/1321
  config.vm.provider "virtualbox" do |vb|
    vb.customize [ "modifyvm", :id, "--uartmode1", "file", "console.log" ]
  end
end
