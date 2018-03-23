name 'resource_handler'
maintainer 'Kevin Reedy'
maintainer_email 'kreedy@chef.io'
license 'Apache-2.0'
description 'Installs/Configures resource_handler'
long_description 'Installs/Configures resource_handler'
version '0.2.0'
chef_version '>= 12.1' if respond_to?(:chef_version)
issues_url 'https://github.com/kevinreedy/resource_handler/issues'
source_url 'https://github.com/kevinreedy/resource_handler'

# Copying the supported OSes from chef_handler
%w(ubuntu debian redhat centos fedora).each do |os|
  supports os
end

depends 'chef_handler'
