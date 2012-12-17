#
# Cookbook Name:: metalprov
# Recipe:: [Setup a Bare Metal Provisioning Environment powered by Razor]
#
# Copyright 2012, Velankani Information Systems, Inc eng@velankani.net
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# cookbooksributed under the License is cookbooksributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "metalprov::installdeps"

gem_package "autotest"
gem_package "base62"
gem_package "bson"
gem_package "bson_ext"
gem_package "colored"
gem_package "daemons"
gem_package "json"
gem_package "logger"
gem_package "macaddr"
gem_package "mocha"
gem_package "mongo"
gem_package "net-ssh"
gem_package "require_all"
gem_package "syntax"
gem_package "uuid"


script "Installing and starting Razor" do
  interpreter "bash"
  user "root"
  code <<-EOH
  mkdir /opt/razor
  cd /opt/razor
  npm install express@2.5.11
  npm install mime
  wget https://github.com/puppetlabs/Razor/archive/master.zip
  unzip master.zip
  /opt/razor/bin/razor_daemon.rb start
  sleep 5s
  EOH
end


