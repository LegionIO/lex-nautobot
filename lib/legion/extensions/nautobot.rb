# frozen_string_literal: true

require 'legion/extensions/nautobot/version'
require 'legion/extensions/nautobot/errors'
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
require 'legion/extensions/nautobot/client'

module Legion
  module Extensions
    module Nautobot
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core, false
    end
  end
end
