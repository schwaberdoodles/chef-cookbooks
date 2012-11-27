#
# Cookbook Name:: pxe
# Recipe:: data_bags [Generate data_bags for use by recipe pxe::dhcpd]
# Notes: This recipe is for Cisco UCS only as it relies no querying assigned
#        MAC addresses on all Service Profiless
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

require 'ucslib'


# There seems to be a problem using the DataBag objects within a recipe
# using data_bag.save. Using create until fix.

name = node[:pxe][:dhcpd][:databag]
ucs_manage = UCSManage.new

def create_data_bag(name)
	data_bag = Chef::DataBag.new
	data_bag.name(name)
	data_bag.create
end

def create_data_bag_items(json)
	databag_item = Chef::DataBagItem.new
	databag_item.data_bag(node[:pxe][:dhcpd][:databag])
	databag_item.raw_data = serviceprofile1 
	databag_item.create	
end

serviceprofile1 = {
  "id" => "serviceprofile1",
  "mac_address" => "00:25:B5:00:00:7F",
  "ip" => "10.10.143.2",
  "gateway" => "10.10.143.1",
  "mask" => "255.255.255.0",
  "broadcast" => "10.10.143.255",
  "host_name" => "serviceprofile1"
}


def run
	create_data_bag(name)
	create_data_bag_items(json)
end

run()