#
# Cookbook Name:: bigdatadev
# Recipe:: [Setup a Big Data Development Environment: Hadoop]
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

# This recipe is for HDP 1.2 on CentOS 6.3 only
# Most of this will refactored in a later version


include_recipe "java::oracle"

dist = node[:bigdatadev][:hadoop][:dist]
path = node[:bigdatadev][:hadoop][:path]
jdk_path = node[:bigdatadev][:hadoop][:jdk_path]
jdk = node[:bigdatadev][:hadoop][:jdk]
java_home = node[:bigdatadev][:hadoop][:java_home]
data_dir = node[:bigdatadev][:hadoop][:data_dir]
user = node[:bigdatadev][:hadoop][:user]

# user node[:bigdatadev][:hadoop][:user] do
#   system true
#   comment "Hadoop User"
#   shell "/bin/false"
# end


script "Installing HDP 1.2 pseudo dist" do
  interpreter "bash"
  user "root"
  code <<-EOH
  wget -nv http://public-repo-1.hortonworks.com/HDP-1.2.0/repos/centos6/hdp.repo -O /etc/yum.repos.d/hdp.repo
  sleep 5
  echo "Installing HDP 1.2. Please wait...."
  yum install hadoop-conf-pseudo.x86_64 -y
  EOH
end


template "/etc/hadoop/conf/hdfs-site.xml" do
  source "hdfs-site.xml.erb"
  mode 0644
end

template "/usr/lib/hadoop/libexec/hadoop-config.sh" do
  source "hadoop-config.sh.erb"
  mode 0644
end

template "/usr/lib/hadoop/bin/hadoop-config.sh" do
  source "hadoop-config-map-reduce.sh.erb"
  mode 0644
end

script "Setting up and starting HDP 1.2 services" do
  interpreter "bash"
  user "root"
  code <<-EOH
  export JAVA_HOME=/usr/lib/jvm/jdk1.6.0_37/
  sudo -iu hdfs hadoop namenode -format
  /etc/init.d/hadoop-namenode start
  /etc/init.d/hadoop-secondarynamenode start
  /etc/init.d/hadoop-datanode start
  EOH
end

script "Setting up and starting HDP 1.2 MapReduce" do
  interpreter "bash"
  user "root"
  code <<-EOH
  sudo -iu hdfs hadoop fs -mkdir /tmp
  sudo -iu hdfs hadoop fs -chmod -R 1777 /tmp
  sudo -iu hdfs hadoop fs -mkdir /var
  sudo -iu hdfs hadoop fs -mkdir /var/lib
  sudo -iu hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs
  sudo -iu hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache
  sudo -iu hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred
  sudo -iu hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred/mapred
  sudo -iu hdfs hadoop fs -mkdir /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
  sudo -iu hdfs hadoop fs -chmod 777 /var/lib/hadoop-hdfs/cache/mapred/mapred/staging
  sudo -iu hdfs hadoop fs -chown -R mapred /var/lib/hadoop-hdfs/cache/mapred
  echo "Verifying HDFS file structure"
  sudo -iu hdfs hadoop fs -ls -R /
  sleep 3
  /etc/init.d/hadoop-jobtracker start
  /etc/init.d/hadoop-tasktracker start
  EOH
end

script "Setting up home directories" do
  interpreter "bash"
  user "root"
  code <<-EOH
  sudo -iu hdfs hadoop fs -mkdir  /user/#{user}
  sudo -iu hdfs hadoop fs -chown #{user} /user/#{user}
  EOH
end
