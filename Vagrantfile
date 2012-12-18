# This is a simple Vagrant file for those who are using
# VirtualBox instead of VMware Fusion on Mac OS X.
# The Vagrant file allows to get an Ubuntu instances up and running 
# to apply cookbooks

Vagrant::Config.run do |config|

  config.vm.define :metalprov do |metalprov_config|
	metalprov_config.vm.box = "metalprov"
	metalprov_config.vm.host_name = "metalprov"
	metalprov_config.vm.box_url = "precise64.box"
	metalprov_config.vm.network :hostonly, "172.16.10.5"
  end

  config.vm.define :automator do |automator_config|
	automator_config.vm.box = "automator"
	automator_config.vm.host_name = "automator"
	automator_config.vm.box_url = "precise64.box"
	automator_config.vm.network :hostonly, "172.16.10.6"
  end


end
