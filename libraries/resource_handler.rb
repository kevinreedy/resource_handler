module ResourceHandler
  class Disk < Chef::Handler
    # Append updated resources to a file. This can be used as a guide for reporting to other systems

    def report
      # Specifiy where to write this log to
      # NOTE: you should rotate this file using your system's log rotation system
      output_file = File.open(File.join(Chef::Config[:file_cache_path], 'updated_resources.log'), 'a+')

      # A list of resources that you don't care to report on
      blacklist = [
        'apt_update[periodic]',
        'yum_globalconfig[/etc/yum.conf]',
      ]

      updated_resources.each do |r|
        # Skip resources in the black list
        next if blacklist.include? r.to_s

        # The updated resource `r` has a ton more information you can log
        # Uncomment the following two lines to get a debug session, so you can
        # determine what information you want to extract. Exit with ^D.
        # require 'pry'
        # binding.pry

        # Append timestamp, node name,resource type/name, and resource source location to log
        resource_line_number = r.source_line.gsub(/^.+\.rb\:(\d+)\:.+$/, '\1')
        resource_location = "#{r.cookbook_name}::#{r.recipe_name}:#{resource_line_number}"
        output_file << "#{DateTime.now}\t#{node['fqdn']}\t#{r}\t#{resource_location}\n"
      end

      output_file.close
    end
  end
end
