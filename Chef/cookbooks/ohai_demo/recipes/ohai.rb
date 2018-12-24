#
# Cookbook:: ohai_demo
# Recipe:: ohai
#
# Copyright:: 2018, The Authors, All Rights Reserved.

file '/etc/motd' do
	content "HOSTNAME: #{node['hostname']}
	IPADDRESS: #{node['ipaddress']}
	"
end
