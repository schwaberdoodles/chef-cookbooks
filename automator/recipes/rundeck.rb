#
# Cookbook Name:: automator
# Recipe:: [Setup packages and Start Rundeck]
#
# Copyright 2012, Velankani Information Systems, Inc, eng@velankani.net
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

include_recipe "automator::default"

dist = node[:automator][:orchestrator][:dist]
path = node[:automator][:orchestrator][:path]

remote_file "/tmp/#{dist}.deb" do
  source "#{path}"
  not_if { File.exists?("/tmp/#{dist}.deb") }
end


script "Installing Rundeck" do
  interpreter "bash"
  user "root"
  code <<-EOH
  dpkg -i /tmp/#{dist}.deb
  EOH
end

service "rundeckd"  do
  supports :start => true, :status => true, :restart => true, :stop => true, :condrestart => true
  action [:enable, :restart]
end