# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'
require 'legion/extensions/nautobot/runners/dcim'
require 'legion/extensions/nautobot/runners/ipam'
require 'legion/extensions/nautobot/runners/circuits'
require 'legion/extensions/nautobot/runners/tenancy'
require 'legion/extensions/nautobot/runners/virtualization'
require 'legion/extensions/nautobot/runners/extras'
require 'legion/extensions/nautobot/runners/users'
require 'legion/extensions/nautobot/runners/cloud'
require 'legion/extensions/nautobot/runners/vpn'
require 'legion/extensions/nautobot/runners/wireless'

module Legion
  module Extensions
    module Nautobot
      class Client
        include Helpers::Client
        include Runners::Dcim
        include Runners::Ipam
        include Runners::Circuits
        include Runners::Tenancy
        include Runners::Virtualization
        include Runners::Extras
        include Runners::Users
        include Runners::Cloud
        include Runners::Vpn
        include Runners::Wireless

        attr_reader :opts

        def initialize(url:, token: nil, read_only: false, **extra)
          @opts = { url: url, token: token, read_only: read_only, **extra }
        end

        def connection(**override)
          super(**@opts.merge(override.compact))
        end
      end
    end
  end
end
