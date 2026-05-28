# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Vpn
          include Legion::Extensions::Nautobot::Helpers::Client

          # VPNs
          def list_vpns(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/vpn/vpns/', params)
            resp.body
          end

          def get_vpn(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/vpn/vpns/#{id}/")
            resp.body
          end

          def create_vpn(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/vpn/vpns/', attrs)
            resp.body
          end

          def update_vpn(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/vpn/vpns/#{id}/", attrs)
            resp.body
          end

          def delete_vpn(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/vpn/vpns/#{id}/")
          end

          # VPN Tunnels
          def list_vpn_tunnels(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/vpn/vpn-tunnels/', params)
            resp.body
          end

          def get_vpn_tunnel(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/vpn/vpn-tunnels/#{id}/")
            resp.body
          end

          def create_vpn_tunnel(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/vpn/vpn-tunnels/', attrs)
            resp.body
          end

          def update_vpn_tunnel(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/vpn/vpn-tunnels/#{id}/", attrs)
            resp.body
          end

          def delete_vpn_tunnel(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/vpn/vpn-tunnels/#{id}/")
          end

          # VPN Tunnel Endpoints
          def list_vpn_tunnel_endpoints(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/vpn/vpn-tunnel-endpoints/', params)
            resp.body
          end

          def get_vpn_tunnel_endpoint(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/vpn/vpn-tunnel-endpoints/#{id}/")
            resp.body
          end

          # VPN Profiles
          def list_vpn_profiles(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/vpn/vpn-profiles/', params)
            resp.body
          end

          def get_vpn_profile(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/vpn/vpn-profiles/#{id}/")
            resp.body
          end

          def create_vpn_profile(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/vpn/vpn-profiles/', attrs)
            resp.body
          end

          # VPN Terminations
          def list_vpn_terminations(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/vpn/vpn-terminations/', params)
            resp.body
          end

          def get_vpn_termination(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/vpn/vpn-terminations/#{id}/")
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
