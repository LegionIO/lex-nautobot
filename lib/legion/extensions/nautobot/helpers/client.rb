# frozen_string_literal: true

require 'faraday'

module Legion
  module Extensions
    module Nautobot
      module Helpers
        module Client
          def connection(url: nil, token: nil, **_opts)
            Faraday.new(url: url) do |conn|
              conn.request :json
              conn.response :json, content_type: /\bjson$/
              conn.headers['Authorization'] = "Token #{token}" if token
              conn.headers['Content-Type'] = 'application/json'
              conn.headers['Accept'] = 'application/json'
            end
          end
        end
      end
    end
  end
end
