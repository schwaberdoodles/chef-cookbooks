# This is a simple Vagrant file for those who are using
# VirtualBox instead of VMware Fusion on Mac OS X.
# The Vagrant file allows to get an Ubuntu instances up and running 
# to apply cookbooks

Vagrant::Config.run do |config|

	config.vm.define :cdh do |cdh_config|
	cdh_config.vm.box = "cdh"
	cdh_config.vm.host_name = "cdh"
	cdh_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	cdh_config.vm.network :hostonly, "172.16.10.162"
	cdh_config.vm.share_folder "cookbooks", "/cookbooks", "/Users/rajum/Development/chef-cookbooks"
	cdh_config.vm.share_folder "dev", "/home/vagrant/dev", "/Users/rajum/Development/IDEA"
	cdh_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "cdh",
	                      "--memory", "1024"
	  ]
	end

  
	config.vm.define :hdp do |hdp_config|
	hdp_config.vm.box = "hdp"
	hdp_config.vm.host_name = "hdp"
	hdp_config.vm.box_url = "CentOS-6.3-x86_64-minimal.box"
	hdp_config.vm.network :hostonly, "172.16.10.163"
	hdp_config.vm.share_folder "cookbooks", "/cookbooks", "/Users/rajum/Development/chef-cookbooks"
	hdp_config.vm.share_folder "dev", "/home/vagrant/dev", "/Users/rajum/Development/IDEA"
	hdp_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "hdp",
	                      "--memory", "1024"
	  ]
	end

	config.vm.define :bdas do |bdas_config|
	bdas_config.vm.box = "bdas"
	bdas_config.vm.host_name = "bdas"
	bdas_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	bdas_config.vm.network :hostonly, "172.16.10.164"
	bdas_config.vm.share_folder "cookbooks", "/cookbooks", "/Users/rajum/Development/chef-cookbooks"
	bdas_config.vm.share_folder "dev", "/home/vagrant/dev", "/Users/rajum/Development/IDEA"
	bdas_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "bdas",
	                      "--memory", "1024"
	  ]
	end

	config.vm.define :logstash do |logstash_config|
	logstash_config.vm.box = "logstash"
	logstash_config.vm.host_name = "logstash"
	logstash_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	logstash_config.vm.network :hostonly, "172.16.10.6"
	logstash_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "logstash",
	                      "--memory", "512"
	  ]
	end

	config.vm.define :devbox do |devbox_config|
	devbox_config.vm.box = "devbox"
	devbox_config.vm.host_name = "devbox"
	devbox_config.vm.box_url = "ubuntu12.0.4.1.LTS.box"
	devbox_config.vm.network :hostonly, "172.16.10.7"
	devbox_config.vm.share_folder "devbox", "/home/vagrant/Development", "/Users/rajum/Development/"
	devbox_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "devbox",
	                      "--memory", "512"
	  ]
	end

	config.vm.define :devops do |devops_config|
	devops_config.vm.box = "devops"
	devops_config.vm.host_name = "devops"
	devops_config.vm.box_url = "CentOS-6.3-x86_64-minimal.box"
	devops_config.vm.network :hostonly, "172.16.10.8"
	devops_config.vm.share_folder "devops", "/home/vagrant/Development", "/Users/rajum/Development/"
	devops_config.vm.customize [
	                      "modifyvm", :id,
	                      "--name", "devops",
	                      "--memory", "512"
	  ]
	end


	
end
