# RailsBridge VM application template for running inside VirtualBox
#
# The VirtualBox NAT interface (which connects the guest to the host) is
# probably 10.0.2.15, but just in case something changes in the future,
# listen on all interfaces, and whitelist all 10.* networks.

environment "config.web_console.whitelisted_ips = '10.0.0.0/8'", env: 'development'

append_file 'config/boot.rb', <<EOF

# Configure server for VirtualBox (added by RailsBridge VM)

require 'rails/commands/server'

module Rails
  class Server
    def default_options
      super.merge(Host: '*', Port: 3000)
    end
  end
end
EOF
