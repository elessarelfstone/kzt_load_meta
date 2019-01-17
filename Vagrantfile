# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  config.vm.define "server" do |server|
    server.vm.box = "ubuntu/trusty64"
    server.vm.hostname = "big-data-meta"
    server.vm.network "private_network", ip: "192.168.56.9"

    # disk1 = File.dirname(__FILE__) + '/vdis/sata1.vdi'
    # disk2 = File.dirname(__FILE__) + '/vdis/sata2.vdi'

    server.vm.provider "virtualbox" do |vb|
      # Display the VirtualBox GUI when booting the machine
      vb.name = "big-data-meta"
      vb.cpus = 2
      vb.memory = "1024"
      # unless FileTest.exist?(disk1)
      #   vb.customize ['createhd', '--filename', disk1, '--variant', 'Fixed', '--size', 1024]
      #   vb.customize ["storagectl", :id, "--name", "SATA Controller", "--add", "sata"]
      # end
      # unless FileTest.exist?(disk2)
      #   vb.customize ['createhd', '--filename', disk2, '--variant', 'Fixed', '--size', 1024]
      # end
      # vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 2, '--device', 0, '--type', 'hdd', '--medium', disk1]
      # vb.customize ['storageattach', :id, '--storagectl', 'SATA Controller', '--port', 3, '--device', 0, '--type', 'hdd', '--medium', disk2]
    end      
  end
end