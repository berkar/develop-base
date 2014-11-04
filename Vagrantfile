# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "ubuntu/trusty64"
  config.vm.provision :shell, path: "bootstrap.sh"

  #JBoss
  config.vm.network :forwarded_port, host: 8080, guest: 8080
  config.vm.network :forwarded_port, host: 9990, guest: 9990
  config.vm.network :forwarded_port, host: 9999, guest: 9999
  config.vm.network :forwarded_port, host: 8787, guest: 8787

  #PostGIS
  config.vm.network :forwarded_port, host: 5432, guest: 5432

  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = false

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end
end
