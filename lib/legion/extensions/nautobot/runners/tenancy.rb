# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Tenancy
          include Legion::Extensions::Nautobot::Helpers::Client

          # Tenant Groups
          def list_tenant_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/tenancy/tenant-groups/', params)
            resp.body
          end

          def get_tenant_group(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/tenancy/tenant-groups/#{id}/")
            resp.body
          end

          def create_tenant_group(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/tenancy/tenant-groups/', attrs)
            resp.body
          end

          def update_tenant_group(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/tenancy/tenant-groups/#{id}/", attrs)
            resp.body
          end

          def delete_tenant_group(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/tenancy/tenant-groups/#{id}/")
          end

          # Tenants
          def list_tenants(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/tenancy/tenants/', params)
            resp.body
          end

          def get_tenant(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/tenancy/tenants/#{id}/")
            resp.body
          end

          def create_tenant(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/tenancy/tenants/', attrs)
            resp.body
          end

          def update_tenant(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/tenancy/tenants/#{id}/", attrs)
            resp.body
          end

          def delete_tenant(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/tenancy/tenants/#{id}/")
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
