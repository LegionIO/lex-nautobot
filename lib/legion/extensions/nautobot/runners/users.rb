# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Users
          include Legion::Extensions::Nautobot::Helpers::Client

          def list_users(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/users/users/', params)
            resp.body
          end

          def get_user(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/users/users/#{id}/")
            resp.body
          end

          def create_user(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/users/users/', attrs)
            resp.body
          end

          def list_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/users/groups/', params)
            resp.body
          end

          def get_group(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/users/groups/#{id}/")
            resp.body
          end

          def list_tokens(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/users/tokens/', params)
            resp.body
          end

          def list_permissions(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/users/permissions/', params)
            resp.body
          end

          def get_permission(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/users/permissions/#{id}/")
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
