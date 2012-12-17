#
# Cookbook Name:: razor
# Recipe:: [Setup a Razor environment for bare metal provisoning]
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


package "build-essential"
package "git"
package "ruby1.9.3"
package "python" 
package "libssl-dev"

template "/etc/apt/sources.list.d/10gen.list" do
  source "10gen.list.erb"
  mode 0644
end

script "Installing MongoDB" do
  interpreter "bash"
  user "root"
  code <<-EOH
  apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
  apt-get update
  apt-get install mongodb-10gen -y
  sleep 5s
  EOH
end

service "mongodb" do
  supports :start => true
end

script "Installing Node.js" do
  interpreter "bash"
  user "root"
  code <<-EOH
  cd /usr/local/src
  mkdir node
  wget http://nodejs.org/dist/v0.9.3/node-v0.9.3.tar.gz
  
  sleep 5s
  EOH
end