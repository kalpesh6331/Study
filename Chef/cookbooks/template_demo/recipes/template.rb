#
# Cookbook:: template_demo
# Recipe:: template
#
# Copyright:: 2018, The Authors, All Rights Reserved.

template '/etc/motd' do
	source 'motd.erb'
	variables(
		:name => 'Kalpesh')
	action :create
end
