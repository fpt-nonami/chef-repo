#
# Cookbook Name:: nodejs
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

version = "#{node[:nodejs][:version]}"

remote_file "/tmp/node-#{version}-linux-x64.tar.gz" do
  source "http://nodejs.org/dist/#{version}/node-#{version}-linux-x64.tar.gz"
end

script "extract" do
  interpreter "bash"
  user "root"
  code <<-EOL
    tar zxvf /tmp/node-#{version}-linux-x64.tar.gz -C /usr/local/
  EOL
end

link "/usr/bin/node" do
  to "/usr/local/node-#{version}-linux-x64/bin/node"
end

link "/usr/bin/npm" do
  to "/usr/local/node-#{version}-linux-x64/bin/npm"
end
