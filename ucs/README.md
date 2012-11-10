Description
===========

A Chef cookbook (beta) to deploy and configure Cisco UCS. The cookbook leverages ucslib and helps setup
a basic Cisco UCS deployment. It acts as a template to highlight what's possible with the UCS API.



Requirements
============

On Ubuntu 12.04, Debian 6 or Mac OS X 10.8.2, install Ruby 1.9.3. RVM is recommended - http://rvm.io

*Future iterations will have a distributed setup using chef-server


Attributes
==========

Attributes are only used for auth info fow now:

default[:ucs][:ip] = '<ip>'
default[:ucs][:username] = 'admin'
default[:ucs][:password] = 'admin'

This cookbook uses data bags for feeding UCS config parameters.

Usage
=====

**The following is a sample setup.

Edit /etc/chef/node.json:

root@dev:~# cat /etc/chef/node.json

	{
	"run_list" : ["recipe[ucs::default]", 
			      "recipe[ucs::initials]",
			      "recipe[ucs::firmware]",
			      "recipe[ucs::ports]",
			      "recipe[ucs::policies]",
			      "recipe[ucs::pools]",
			      "recipe[ucs::network]",
			      "recipe[ucs::storage]",
			      "recipe[ucs::templates]",
			      "recipe[ucs::serviceprofiles]",
			      "recipe[ucs::manage]"
			    ]
	}

root@dev:~# 


Edit /etc/chef/solo.rb

	cookbook_path "/etc/chef/cookbooks"
	file_cache_path "/etc/chef-solo" #Default
	role_path "/etc/chef-solo/roles" #Default
	data_bag_path "/etc/chef-solo/data_bags" #Default
	json_attribs "/etc/chef/node.json" #Also not default


To run:

	root@dev:~# chef-solo  -j /etc/chef/node.json

	[2012-11-09T21:18:01-05:00] INFO: *** Chef 10.16.2 ***
	[2012-11-09T21:18:02-05:00] INFO: Setting the run_list to ["recipe[ucs::default]", "recipe[ucs::initials]", "recipe[ucs::firmware]", "recipe[ucs::ports]", "recipe[ucs::policies]", "recipe[ucs::pools]", "recipe[ucs::network]", "recipe[ucs::storage]", "recipe[ucs::templates]", "recipe[ucs::serviceprofiles]", "recipe[ucs::manage]"] from JSON
	[2012-11-09T21:18:02-05:00] INFO: Run List is [recipe[ucs::default], recipe[ucs::initials], recipe[ucs::firmware], recipe[ucs::ports], recipe[ucs::policies], recipe[ucs::pools], recipe[ucs::network], recipe[ucs::storage], recipe[ucs::templates], recipe[ucs::serviceprofiles], recipe[ucs::manage]]
	[2012-11-09T21:18:02-05:00] INFO: Run List expands to [ucs::default, ucs::initials, ucs::firmware, ucs::ports, ucs::policies, ucs::pools, ucs::network, ucs::storage, ucs::templates, ucs::serviceprofiles, ucs::manage]
	[2012-11-09T21:18:02-05:00] INFO: Starting Chef Run for dev
	[2012-11-09T21:18:02-05:00] INFO: Running start handlers
	[2012-11-09T21:18:02-05:00] INFO: Start handlers complete.
	[2012-11-09T21:18:12-05:00] INFO: Processing package[libxml2-dev] action install (ucs::default line 21)
	[2012-11-09T21:18:12-05:00] INFO: Processing package[libxslt1-dev] action install (ucs::default line 22)
	[2012-11-09T21:18:12-05:00] INFO: Processing gem_package[ucslib] action install (ucs::default line 23)
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Installation of ucslib and dependencies] action write (ucs::default line 25)
	[2012-11-09T21:18:12-05:00] INFO: Installation of ucslib and dependencies
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"ntp_server":"192.168.207.250"}] action write (ucs::initials line 67)
	[2012-11-09T21:18:12-05:00] INFO: {"ntp_server":"192.168.207.250"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"ntp_server":"192.168.207.251"}] action write (ucs::initials line 67)
	[2012-11-09T21:18:12-05:00] INFO: {"ntp_server":"192.168.207.251"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"time_zone":"America/New_York"}] action write (ucs::initials line 71)
	[2012-11-09T21:18:12-05:00] INFO: {"time_zone":"America/New_York"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"power_policy":"grid"}] action write (ucs::initials line 74)
	[2012-11-09T21:18:12-05:00] INFO: {"power_policy":"grid"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"chassis_discovery_policy":"4-link"}] action write (ucs::initials line 77)
	[2012-11-09T21:18:12-05:00] INFO: {"chassis_discovery_policy":"4-link"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"local_disk_policy":"any-configuration"}] action write (ucs::initials line 80)
	[2012-11-09T21:18:12-05:00] INFO: {"local_disk_policy":"any-configuration"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"start_ip":"10.10.1.5","end_ip":"10.10.1.10","subnet_mask":"255.255.255.0","gateway":"10.10.1.1"}] action write (ucs::initials line 83)

	----snipped for brevity----

	[2012-11-09T21:18:12-05:00] INFO: {"start_ip":"10.10.1.5","end_ip":"10.10.1.10","subnet_mask":"255.255.255.0","gateway":"10.10.1.1"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"org":"HR","description":"HR Organization"}] action write (ucs::initials line 92)
	[2012-11-09T21:18:12-05:00] INFO: {"org":"HR","description":"HR Organization"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[{"org":"IT","description":"IT Organization"}] action write (ucs::initials line 92)
	[2012-11-09T21:18:12-05:00] INFO: {"org":"IT","description":"IT Organization"}
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Host Firmware Package vdi-fw for N20-AC0002] action write (ucs::firmware line 66)
	[2012-11-09T21:18:12-05:00] INFO: Created Host Firmware Package vdi-fw for N20-AC0002
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Host Firmware Package vdi-fw for B230-BASE-M2] action write (ucs::firmware line 66)
	[2012-11-09T21:18:12-05:00] INFO: Created Host Firmware Package vdi-fw for B230-BASE-M2
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Host Firmware Package vdi-fw for B230-BASE-M2] action write (ucs::firmware line 66)
	[2012-11-09T21:18:12-05:00] INFO: Created Host Firmware Package vdi-fw for B230-BASE-M2
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Host Firmware Package vdi-fw for N20-AE0002] action write (ucs::firmware line 66)
	[2012-11-09T21:18:12-05:00] INFO: Created Host Firmware Package vdi-fw for N20-AE0002
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Host Firmware Package vdi-fw for N20-AQ0002] action write (ucs::firmware line 66)
	[2012-11-09T21:18:12-05:00] INFO: Created Host Firmware Package vdi-fw for N20-AQ0002
	[2012-11-09T21:18:12-05:00] INFO: Processing log[Created Mgmt Firmware Package vdi-fw for B230-BASE-M2] action write (ucs::firmware line 87)
	[2012-11-09T21:18:12-05:00] INFO: Created Mgmt Firmware Package vdi-fw for B230-BASE-M2
	
	[2012-11-09T21:18:12-05:00] INFO: Chef Run complete in 10.001281155 seconds
	[2012-11-09T21:18:12-05:00] INFO: Running report handlers
	[2012-11-09T21:18:12-05:00] INFO: Report handlers complete

	root@dev:~# 

ToDo
====

1. Move authentication info to encrypted Data Bags. Currently uses attributes.