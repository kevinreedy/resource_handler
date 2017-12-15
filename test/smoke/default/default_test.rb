# # encoding: utf-8

# Inspec test for recipe resource_handler::default

# The Inspec reference, with examples and extensive documentation, can be
# found at http://inspec.io/docs/reference/resources/

describe file('/tmp/kitchen/cache/updated_resources.log') do
  it { should exist }
  its('size') { should be > 0 }
end
