#
# Cookbook Name:: pxe
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package "dhcp3-server"

service "isc-dhcp-server" do
  supports :status => true, :restart => true
  action [:enable, :start]
end

template "/etc/dhcp/dhcpd.conf" do
  notifies :restart, "service[isc-dhcp-server]"
end