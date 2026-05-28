# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Extras
          include Legion::Extensions::Nautobot::Helpers::Client

          # Tags
          def list_tags(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/tags/', params)
            resp.body
          end

          def get_tag(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/tags/#{id}/")
            resp.body
          end

          def create_tag(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/tags/', attrs)
            resp.body
          end

          # Statuses
          def list_statuses(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/statuses/', params)
            resp.body
          end

          def get_status(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/statuses/#{id}/")
            resp.body
          end

          def create_status(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/statuses/', attrs)
            resp.body
          end

          # Roles
          def list_roles(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/roles/', params)
            resp.body
          end

          def get_role(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/roles/#{id}/")
            resp.body
          end

          def create_role(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/roles/', attrs)
            resp.body
          end

          # Custom Fields
          def list_custom_fields(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/custom-fields/', params)
            resp.body
          end

          def get_custom_field(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/custom-fields/#{id}/")
            resp.body
          end

          def create_custom_field(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/custom-fields/', attrs)
            resp.body
          end

          # Custom Links
          def list_custom_links(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/custom-links/', params)
            resp.body
          end

          # Computed Fields
          def list_computed_fields(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/computed-fields/', params)
            resp.body
          end

          # Config Contexts
          def list_config_contexts(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/config-contexts/', params)
            resp.body
          end

          def get_config_context(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/config-contexts/#{id}/")
            resp.body
          end

          def create_config_context(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/config-contexts/', attrs)
            resp.body
          end

          def update_config_context(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/extras/config-contexts/#{id}/", attrs)
            resp.body
          end

          def delete_config_context(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/extras/config-contexts/#{id}/")
          end

          # Config Context Schemas
          def list_config_context_schemas(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/config-context-schemas/', params)
            resp.body
          end

          # Dynamic Groups
          def list_dynamic_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/dynamic-groups/', params)
            resp.body
          end

          def get_dynamic_group(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/dynamic-groups/#{id}/")
            resp.body
          end

          # Git Repositories
          def list_git_repositories(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/git-repositories/', params)
            resp.body
          end

          def get_git_repository(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/git-repositories/#{id}/")
            resp.body
          end

          def sync_git_repository(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post("/api/extras/git-repositories/#{id}/sync/")
            resp.body
          end

          # Jobs
          def list_jobs(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/jobs/', params)
            resp.body
          end

          def get_job(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/jobs/#{id}/")
            resp.body
          end

          def run_job(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post("/api/extras/jobs/#{id}/run/", attrs)
            resp.body
          end

          def list_job_results(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/job-results/', params)
            resp.body
          end

          def get_job_result(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/job-results/#{id}/")
            resp.body
          end

          def list_scheduled_jobs(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/scheduled-jobs/', params)
            resp.body
          end

          # Secrets
          def list_secrets(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/secrets/', params)
            resp.body
          end

          def get_secret(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/secrets/#{id}/")
            resp.body
          end

          def list_secrets_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/secrets-groups/', params)
            resp.body
          end

          # Relationships
          def list_relationships(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/relationships/', params)
            resp.body
          end

          def get_relationship(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/relationships/#{id}/")
            resp.body
          end

          # Webhooks
          def list_webhooks(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/webhooks/', params)
            resp.body
          end

          def get_webhook(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/webhooks/#{id}/")
            resp.body
          end

          def create_webhook(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/webhooks/', attrs)
            resp.body
          end

          # GraphQL
          def graphql_query(query:, variables: nil, url: nil, token: nil, **)
            payload = { query: query }
            payload[:variables] = variables if variables
            resp = connection(url: url, token: token).post('/api/graphql/', payload)
            resp.body
          end

          # Notes
          def list_notes(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/notes/', params)
            resp.body
          end

          # Object Changes (changelog)
          def list_object_changes(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/object-changes/', params)
            resp.body
          end

          def get_object_change(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/object-changes/#{id}/")
            resp.body
          end

          # Contacts
          def list_contacts(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/contacts/', params)
            resp.body
          end

          def get_contact(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/contacts/#{id}/")
            resp.body
          end

          def create_contact(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/extras/contacts/', attrs)
            resp.body
          end

          # Teams
          def list_teams(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/teams/', params)
            resp.body
          end

          def get_team(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/teams/#{id}/")
            resp.body
          end

          # External Integrations
          def list_external_integrations(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/extras/external-integrations/', params)
            resp.body
          end

          def get_external_integration(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/extras/external-integrations/#{id}/")
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
