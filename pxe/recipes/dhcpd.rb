#
# Cookbook Name:: pxe
# Recipe:: dhcpd [Generate dhcpd.conf for each unique host]
#
# Copyright 2012, Murali Raju, murali.raju@appliv.com
# Copyright 2012, Velankani Information Systems, eng@velankani.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


service "isc-dhcp-server"


template "/etc/default/isc-dhcp-server" do
  source "isc-dhcp-server.erb"
  owner "root"
  group "root"
  mode 0644
  notifies(:restart, resources(:service => "isc-dhcp-server"))
end

template "/etc/dhcp/dhcpd.conf" do
  source "dhcpd.conf.erb"
  owner "root"
  group "root"
  mode 0644
  # variables({
  #   :hosts => node[:pxe][:dhcp][:hosts]
  # })
  hosts = []
  service_profiles = data_bag('dhcpd')
  service_profiles.each do |service_profile_info|
    hosts << service_profile = data_bag_item('dhcpd', service_profile_info)
    variables({:hosts => hosts})
  end
  
  notifies(:restart, resources(:service => "isc-dhcp-server"))
end


