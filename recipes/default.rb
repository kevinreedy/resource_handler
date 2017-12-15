#
# Cookbook:: resource_handler
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

# Register handler in libraries/resource_handler.rb
chef_handler 'ResourceHandler::Disk' do
  action :enable
end

# Write random content to file, so a resource always updates
file '/tmp/resource_handler_test.txt' do
  content "random text - #{SecureRandom.hex}"
end
