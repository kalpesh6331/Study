#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

# frozen_string_literal: true
haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

#haproxy_backend 'servers' do
#  server [
#	  'web1 3.82.93.50:80 maxconn 32',
#	  'web2 54.196.60.43:80 maxconn 32'
#  ]
#end

all_web_nodes = search('node', 'role:web')

servers = []

all_web_nodes.each do |web_node|
  server = "#{web_node['hostname']} #{web_node['ipaddress']}:80 maxconn 32"
  servers.push(server)
end

haproxy_backend 'servers' do
  server servers
end

haproxy_service 'haproxy' do
  subscribes :reload, 'template[/etc/haproxy/haproxy.cfg]', :immediately
end
