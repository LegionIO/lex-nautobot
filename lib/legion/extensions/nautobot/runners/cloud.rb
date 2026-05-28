# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Cloud
          include Legion::Extensions::Nautobot::Helpers::Client

          # Cloud Accounts
          def list_cloud_accounts(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/cloud/cloud-accounts/', params)
            resp.body
          end

          def get_cloud_account(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/cloud/cloud-accounts/#{id}/")
            resp.body
          end

          def create_cloud_account(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/cloud/cloud-accounts/', attrs)
            resp.body
          end

          def update_cloud_account(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/cloud/cloud-accounts/#{id}/", attrs)
            resp.body
          end

          def delete_cloud_account(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/cloud/cloud-accounts/#{id}/")
          end

          # Cloud Networks
          def list_cloud_networks(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/cloud/cloud-networks/', params)
            resp.body
          end

          def get_cloud_network(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/cloud/cloud-networks/#{id}/")
            resp.body
          end

          def create_cloud_network(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/cloud/cloud-networks/', attrs)
            resp.body
          end

          def update_cloud_network(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/cloud/cloud-networks/#{id}/", attrs)
            resp.body
          end

          def delete_cloud_network(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/cloud/cloud-networks/#{id}/")
          end

          # Cloud Services
          def list_cloud_services(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/cloud/cloud-services/', params)
            resp.body
          end

          def get_cloud_service(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/cloud/cloud-services/#{id}/")
            resp.body
          end

          def create_cloud_service(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/cloud/cloud-services/', attrs)
            resp.body
          end

          # Cloud Resource Types
          def list_cloud_resource_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/cloud/cloud-resource-types/', params)
            resp.body
          end

          def get_cloud_resource_type(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/cloud/cloud-resource-types/#{id}/")
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
