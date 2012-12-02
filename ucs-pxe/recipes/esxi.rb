#
# Cookbook Name:: pxe
# Recipe:: tftpd [Setup ESXi via tftpd]
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
#Uncomment to debug
#log "Using: #{node[:ucs][:ip]}, #{node[:ucs][:username]}, #{node[:ucs][:password]}"

#JSON Definitions Start
auth_json = {:ip => "#{node[:pxe][:ucs][:ip]}",
             :username => "#{node[:pxe][:ucs][:username]}",
             :password => "#{node[:pxe][:ucs][:password]}"}.to_json

#JSON Definitions End

#Initialize Objects
ucs_session = UCSToken.new
token_json = ucs_session.get_token(auth_json)
@ucs_manager = UCSManage.new(token_json)
#Uncomment to debug
#log token_json


dist = node[:pxe][:esxi][:release][:dist]
path = node[:pxe][:esxi][:release][:path]
syslinux = node[:pxe][:linux][:release][:dist]
syslinux_path = node[:pxe][:linux][:release][:path]

remote_file "/tmp/#{dist}.iso" do
  source "#{path}"
  not_if { File.exists?("/tmp/#{dist}.iso") }
end

remote_file "/tmp/#{syslinux}.tar.gz" do
  source "#{path}"
  not_if { File.exists?("/tmp/#{syslinux}.tar.gz") }
end


script "copy install files [syslinux and esxi]" do
  interpreter "bash"
  user "root"
  code <<-EOH
  mkdir /var/www/esxi/
  mkdir /var/lib/tftpboot/pxelinux.cfg
  mount -o loop /tmp/#{dist}.iso /mnt
  cp -a /mnt/* /var/www/esxi/
  cp -a /mnt/* /var/lib/tftpboot/
  cd /tmp
  tar -zxvf #{syslinux}.tar.gz
  cd #{syslinux}
  cp core/pxelinux.0 /var/lib/tftpboot/
  cp /var/lib/tftpboot/isolinux.cfg /var/lib/tftpboot/pxelinux.cfg
  EOH
end




service "networking" do
  supports :restart => true
end

service "isc-dhcp-server"  do
  supports :restart => true
end

service "tftpd-hpa"  do
  supports :restart => true
end


state = @ucs_manager.discover_state
state.xpath("configResolveClasses/outConfigs/macpoolPooled").each do |macpool|
  if "#{macpool.attributes["assigned"]}" == 'yes' and "#{macpool.attributes["assignedToDn"].to_s.scan(/ether-vNIC-(\w+)/)}" == '[["A"]]'
    mac = "#{macpool.attributes["id"]}"
    template "/var/lib/tftpboot/pxelinux.cfg/01-#{mac}" do # It looks for 01-#{mac} for some reason.
        source "pxelinux.ubuntu.erb"
        mode 0644
        variables({
          :mac => mac,
          :release => node[:pxe][:os][:release]
        })
        notifies :restart, resources(:service => "tftpd-hpa"), :delayed
    end
  end
end

# template "/var/lib/tftpboot/preseed.ubuntu.cfg" do
#   source "preseed.ubuntu.cfg.erb"
#   mode 0644
# end

template "/var/www/esxi/ks.cfg" do
  source "kickstart.esxi.erb"
  mode 0644
end
