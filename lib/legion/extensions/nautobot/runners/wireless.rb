# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Wireless
          include Legion::Extensions::Nautobot::Helpers::Client

          def list_radio_profiles(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/wireless/radio-profiles/', params)
            resp.body
          end

          def get_radio_profile(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/wireless/radio-profiles/#{id}/")
            resp.body
          end

          def create_radio_profile(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/wireless/radio-profiles/', attrs)
            resp.body
          end

          def list_wireless_networks(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/wireless/wireless-networks/', params)
            resp.body
          end

          def get_wireless_network(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/wireless/wireless-networks/#{id}/")
            resp.body
          end

          def create_wireless_network(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/wireless/wireless-networks/', attrs)
            resp.body
          end

          def list_supported_data_rates(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/wireless/supported-data-rates/', params)
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
