# This is a simple Vagrant file for those who are using
# VirtualBox instead of VMware Fusion on Mac OS X.
# The Vagrant file allows to get an Ubuntu instances up and running 
# to apply cookbooks

Vagrant::Config.run do |config|

  config.vm.define :metalprov do |metalprov_config|
	metalprov_config.vm.box = "metalprov"
	metalprov_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	metalprov_config.vm.network :hostonly, "172.16.10.5"
  end

  config.vm.define :node01 do |node01_config|
	node01_config.vm.box = "node01"
	node01_config.vm.box_url = "http://files.vagrantup.com/precise64.box"
	node01_config.vm.network :hostonly, "172.16.10.6"
  end


end
