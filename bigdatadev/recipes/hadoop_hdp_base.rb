#
# Cookbook Name:: bigdatadev
# Recipe:: [Setup a Big Data Development Environment using HDP]
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

# This recipe is for Cloudera Hadoop CDH4 on Ubuntu 12.04.LTS only
# Most of this will refactored in a later version


repo_path = node[:bigdatadev][:hadoop][:yum_repo_path]

user node[:bigdatadev][:hadoop][:user] do
  system true
  comment "Hadoop User"
  shell "/bin/false"
end

script "Preparing environment for HDP" do
  interpreter "bash"
  user "root"
  code <<-EOH
  wget -nv #{repo_path} -O /etc/yum.repos.d/hdp.repo
  sleep 5
  EOH
end


