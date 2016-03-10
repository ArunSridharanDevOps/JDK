#
# Cookbook Name:: jdk
# Recipe:: default
# Copyright 2015, YOUR_COMPANY_NAME
# All rights reserved - Do Not Redistribute

jdk_user = node['jdk']['user_id']
jdk_group = node['jdk']['group']
jdk_root = node['jdk']['root']
jdk_conf_root = node['jdk']['conf_root']
jdk_rpm_local_file = node['jdk']['rpm_file']
jdk_rpm_s3_file = node['jdk']['s3_url']

group jdk_group do
  group_name jdk_group
  gid 20338
end

user jdk_user do
  uid 3006554
  gid 20338
end

[jdk_root, jdk_conf_root]. each do |dirname|
  directory dirname do
    mode '755'
    recursive true
    owner jdk_user
    group jdk_group
    action :create
  end
end

remote_file jdk_rpm_local_file do
  source jdk_rpm_s3_file
  mode '0755'
  action :create
end

 rpm_package jdk_rpm_local_file do
    action :install
  end
