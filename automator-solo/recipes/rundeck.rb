#
# Cookbook Name:: automator-solo
# Recipe:: [Setup packages]
#
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

include_recipe "automator-solo::default"
include_recipe "java::oracle"

dist = node[:automator][:orchestrator][:dist]
path = node[:automator][:orchestrator][:path]

remote_file "/tmp/#{dist}.jar" do
  source "#{path}"
  not_if { File.exists?("/tmp/#{dist}.jar") }
end


script "Installing and starting rundeck" do
  interpreter "bash"
  user "root"
  code <<-EOH
  mkdir /usr/local/rundeck
  cp /tmp/#{dist}.jar /usr/local/rundeck
  java -jar /usr/local/rundeck/#{dist}.jar 2>&1 /var/log/rundeck/rundeck.log &
  EOH
end