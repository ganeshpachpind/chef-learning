#
# Cookbook Name:: learn_activemq
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.force_default['java']['jdk_version'] = '7'
include_recipe 'java'
include_recipe 'firewalld'

# transport port
firewalld_port '61616/tcp'
# admin port
firewalld_port '8161/tcp'

remote_file "/opt/apache-activemq-5.9.0-bin.tar.gz" do
  source "http://archive.apache.org/dist/activemq/apache-activemq/5.9.0/apache-activemq-5.9.0-bin.tar.gz"
  action :create
end

package 'tar'

execute 'activemq_tar' do
  command 'tar zxvf apache-activemq-5.9.0-bin.tar.gz'
  cwd '/opt/'
end

link '/etc/init.d/activemq' do
  to "/opt/apache-activemq-5.9.0/bin/linux-x86-64/activemq"
end

file "/opt/apache-activemq-5.9.0/bin/linux-x86-64/activemq" do
  owner 'ec2-user'
  group 'ec2-user'
  mode '0755'
end

service 'activemq' do
  supports restart: true, status: true
  action [:enable, :start]
end
