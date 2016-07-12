# -*- mode: ruby -*-
# vi: set ft=ruby :
#^syntax detection

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "hashicorp/precise64"
   
  config.vm.define "consul1" do |consul1|
	config.vm.provision "shell" do |s|
		s.path = "provision.sh"
	end
    consul1.vm.hostname = "consul1"
	consul1.vm.network "private_network", ip: "172.20.20.10"
	config.vm.synced_folder ".vagrant/", "/consul1",
      owner: "root", group: "root"
  end
  
  config.vm.define "consul2" do |consul2|
	config.vm.provision "shell" do |s|
		s.path = "provision1.sh"
	end
    consul2.vm.hostname = "consul2"
	consul2.vm.network "private_network", ip: "172.20.20.20"
	config.vm.synced_folder ".vagrant/", "/consul2",
      owner: "root", group: "root"
  end
  
  config.vm.define "consul3" do |consul3|
	config.vm.provision "shell" do |s|
		s.path = "provision2.sh"
	end
    consul3.vm.hostname = "consul3"
	consul3.vm.network "private_network", ip: "172.20.20.30"
	config.vm.synced_folder ".vagrant/", "/consul3",
      owner: "root", group: "root"
  end
  
  config.vm.define "consulclient" do |client|
	config.vm.provision "shell" do |s|
		s.path = "provisionclient.sh"
    end
    client.vm.hostname = "consulclient"
	client.vm.network "private_network", ip: "172.20.20.40"
	config.vm.synced_folder ".vagrant/", "/consulclient",
      owner: "root", group: "root"
  end
end