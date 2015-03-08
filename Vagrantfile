# -*- mode: ruby -*-
# vi: set ft=ruby :

name = ENV['USER']
ipaddress = '192.168.33.60'

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "centos-65-x64-virtualbox-puppet"
  config.vm.box_download_insecure = true
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/centos-65-x64-virtualbox-puppet.box"
  config.ssh.forward_agent = true
  config.vm.synced_folder "hieradata", "/tmp/vagrant-hieradata/hieradata"
  config.vm.synced_folder '.', '/vagrant', type: 'nfs'
  config.vm.provider :virtualbox do |vb|
     vb.customize ["modifyvm", :id, "--memory", "4096"]
     vb.customize ["modifyvm", :id, "--cpus", "2"]
  end
  
  config.vm.define "vagrant", autostart: true do |v|
    v.vm.hostname = "centos-#{name}.dev"
    v.vm.network :private_network, ip: "#{ipaddress}"
  end

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "manifests"
    puppet.manifest_file  = "vagrant-site.pp"
    puppet.module_path = "modules"
    puppet.hiera_config_path = "hiera.yaml"
    puppet.working_directory = "/tmp/vagrant-hieradata"
  end

end
