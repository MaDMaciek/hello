# # -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.configure(2) do |config|

    # Instal docker, build application and run container
    config.vm.provision "shell", path: "basic_setup.sh"
  
    # Test server 1
    config.vm.define "santander" do |santander|
      santander.vm.box = "ubuntu/bionic64"
      santander.vm.hostname = "santander"
      santander.vm.network "forwarded_port", guest: 80, host: 8080, id: "nginx-angular"
      
      # Set VM parameters
      santander.vm.provider "virtualbox" do |vbox|
        vbox.name = "santander"
        vbox.memory = 2048
        vbox.cpus = 2
      end
    end
  end
  
  