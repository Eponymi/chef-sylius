#
# Cookbook Name:: sylius
# Recipe:: default
#
# Copyright (C) 2013 Dylan Johnson
# 
# All rights reserved - Do Not Redistribute
#

include_recipe "apache2"
#include_recipe "mysql::client"

directory "#{node['sylius']['apache2']['path']}" do
  mode 00755
  action :create
end


web_app "#{node['sylius']['apache2']['server_name']}" do
  template 'app.conf.erb'
  docroot node['sylius']['apache2']['docroot']
  server_name "#{node['sylius']['apache2']['server_name']}"
end
