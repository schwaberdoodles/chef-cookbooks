# This is a simple Vagrant file for those who are using
# VirtualBox instead of VMware Fusion on Mac OS X.
# The Vagrant file allows to get an Ubuntu instances up and running 
# to apply cookbooks

Vagrant::Config.run do |config|

  config.vm.define :metalprov do |metalprov_config|
	metalprov_config.vm.box = "metalprov"
	metalprov_config.vm.host_name = "metalprov"
	metalprov_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	metalprov_config.vm.network :hostonly, "172.16.10.5"
	metalprov_config.vm.customize [
                        "modifyvm", :id,
                        "--name", "metalprov",
                        "--memory", "512"
    ]
  end

  config.vm.define :automator do |automator_config|
	automator_config.vm.box = "automator"
	automator_config.vm.host_name = "automator"
	automator_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	automator_config.vm.network :hostonly, "172.16.10.6"
	automator_config.vm.customize [
                        "modifyvm", :id,
                        "--name", "automator",
                        "--memory", "512"
    ]
  end


end
