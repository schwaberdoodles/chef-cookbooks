Description
===========

A Chef cookbook (beta) that builds a PXE appliance for Cisco UCS bare-metal deployment. This cookbook acts as the stage 2 phase for DC Automation.
As of now, the recipes are tied specifically towards the workflow defined by ucs or ucs-solo cookbooks.

Requirements
============

The PXE appliance is currently tested on Ubuntu 12.04.1 LTS. Other platform OSs as well as target OS's will be supported in the future.

Supported Targest OS Environments:
	
	Ubuntu 12.04.1 LTS


Attributes
==========

	#UCS
	default[:pxe][:ucs][:ip] = '192.168.73.131'
	default[:pxe][:ucs][:username] = 'admin'
	default[:pxe][:ucs][:password] = 'admin'


	#DHCP
	default[:pxe][:dhcpd][:dns_server] = "192.168.73.250"
	default[:pxe][:dhcpd][:next_server] = "192.168.73.136"
	default[:pxe][:dhcpd][:subnet] = "192.168.73.0"
	default[:pxe][:dhcpd][:subnet_mask] = "255.255.255.0"
	default[:pxe][:dhcpd][:broadcast] = "192.168.73.255"
	default[:pxe][:dhcpd][:gateway] = "192.168.73.1"
	default[:pxe][:dhcpd][:host_range] = "192.168.73.150 192.168.73.200"
	default[:pxe][:dhcpd][:interfaces] = ['eth0']
	default[:pxe][:dhcpd][:filename] = "pxelinux.0"
	default[:pxe][:dhcpd][:databag] = "dhcpd"


	#OS 
	default[:pxe][:preseed][:username] = "chef"
	default[:pxe][:preseed][:password] = "chef101"


	#Ubuntu
	default[:pxe][:os][:release] = "ubuntu-12.04.1"
	default[:pxe][:linux][:release][:dist] = "ubuntu-12.04.1"
	default[:pxe][:linux][:release][:path] = "http://mirror.anl.gov/pub/ubuntu-iso/CDs/12.04/ubuntu-12.04.1-server-amd64.iso"

Usage
=====

Follows a convention. The run_list order using knife:

	1. Install packages

	knife node run_list add <node> recipe[ucs-pxe::default]
	knife ssh name:<node> -x <username> -P <password> "sudo chef-client"

	2. Setup the databags needed for generating the custom dhcpd.conf

	knife node run_list remove <node> recipe[ucs-pxe::default]
	knife node run_list add <node> recipe[ucs-pxe::databag]
	knife ssh name:<node> -x <username> -P <password> "sudo chef-client"

	3. Setup dhcpd.conf based on mac addresses of all assigned service profiles

	knife node run_list remove <node> recipe[ucs-pxe::databag]
	knife node run_list add <node> recipe[ucs-pxe::dhcpd]
	knife ssh name:<node> -x <username> -P <password> "sudo chef-client"

	4. Build target OS environment to be deployed.

	knife node run_list remove <node> recipe[ucs-pxe::dhcpd]
	knife node run_list add <node> recipe[ucs-pxe::ubuntu]
	knife ssh name:<node> -x <username> -P <password> "sudo chef-client"

	5. Reboot Service Profile(s). The install should begin.

	6. The system halts after installation is complete.


ToDo
=====

1. Reciple for toggling boot policy to boot from disk to move towards Stage 3 - service provisioning.






