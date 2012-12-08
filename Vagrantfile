# This is a simple Vagrant file for those who are using
# VirtualBox instead of VMware Fusion on Mac OS X.
# The Vagrant file allows to get an Ubuntu instance up and running 
# to apply cookbooks

Vagrant::Config.run do |config|
  config.vm.box = "automator"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.network :hostonly, "<ip address to use>"
  config.vm.share_folder "chef-cookbooks", "/cookbooks", "."
end
