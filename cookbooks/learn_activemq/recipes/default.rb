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

node.force_default['activemq']['mirror'] = 'http://archive.apache.org/dist'
node.force_default['activemq']['version'] = '5.7.0'

include_recipe 'activemq'
