# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Ipam
          include Legion::Extensions::Nautobot::Helpers::Client

          # Namespaces
          def list_namespaces(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/namespaces/', params)
            resp.body
          end

          def get_namespace(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/namespaces/#{id}/")
            resp.body
          end

          def create_namespace(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/namespaces/', attrs)
            resp.body
          end

          # VRFs
          def list_vrfs(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/vrfs/', params)
            resp.body
          end

          def get_vrf(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/vrfs/#{id}/")
            resp.body
          end

          def create_vrf(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/vrfs/', attrs)
            resp.body
          end

          def update_vrf(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/ipam/vrfs/#{id}/", attrs)
            resp.body
          end

          def delete_vrf(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/ipam/vrfs/#{id}/")
          end

          # Route Targets
          def list_route_targets(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/route-targets/', params)
            resp.body
          end

          # RIRs
          def list_rirs(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/rirs/', params)
            resp.body
          end

          # Prefixes
          def list_prefixes(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/prefixes/', params)
            resp.body
          end

          def get_prefix(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/prefixes/#{id}/")
            resp.body
          end

          def create_prefix(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/prefixes/', attrs)
            resp.body
          end

          def update_prefix(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/ipam/prefixes/#{id}/", attrs)
            resp.body
          end

          def delete_prefix(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/ipam/prefixes/#{id}/")
          end

          def available_prefixes(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/prefixes/#{id}/available-prefixes/")
            resp.body
          end

          # IP Addresses
          def list_ip_addresses(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/ip-addresses/', params)
            resp.body
          end

          def get_ip_address(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/ip-addresses/#{id}/")
            resp.body
          end

          def create_ip_address(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/ip-addresses/', attrs)
            resp.body
          end

          def update_ip_address(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/ipam/ip-addresses/#{id}/", attrs)
            resp.body
          end

          def delete_ip_address(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/ipam/ip-addresses/#{id}/")
          end

          def available_ips(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/prefixes/#{id}/available-ips/")
            resp.body
          end

          # VLANs
          def list_vlan_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/vlan-groups/', params)
            resp.body
          end

          def get_vlan_group(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/vlan-groups/#{id}/")
            resp.body
          end

          def list_vlans(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/vlans/', params)
            resp.body
          end

          def get_vlan(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/vlans/#{id}/")
            resp.body
          end

          def create_vlan(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/vlans/', attrs)
            resp.body
          end

          def update_vlan(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/ipam/vlans/#{id}/", attrs)
            resp.body
          end

          def delete_vlan(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/ipam/vlans/#{id}/")
          end

          # Services
          def list_services(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/ipam/services/', params)
            resp.body
          end

          def get_service(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/ipam/services/#{id}/")
            resp.body
          end

          def create_service(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/ipam/services/', attrs)
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
