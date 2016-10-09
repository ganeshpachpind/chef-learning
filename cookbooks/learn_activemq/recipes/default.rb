#
# Cookbook Name:: learn_activemq
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.force_default['java']['jdk_version'] = '7'
include_recipe 'java'
