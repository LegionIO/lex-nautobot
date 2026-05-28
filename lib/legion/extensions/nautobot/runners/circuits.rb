# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Circuits
          include Legion::Extensions::Nautobot::Helpers::Client

          # Providers
          def list_providers(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/circuits/providers/', params)
            resp.body
          end

          def get_provider(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/circuits/providers/#{id}/")
            resp.body
          end

          def create_provider(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/circuits/providers/', attrs)
            resp.body
          end

          def update_provider(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/circuits/providers/#{id}/", attrs)
            resp.body
          end

          def delete_provider(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/circuits/providers/#{id}/")
          end

          # Provider Networks
          def list_provider_networks(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/circuits/provider-networks/', params)
            resp.body
          end

          def get_provider_network(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/circuits/provider-networks/#{id}/")
            resp.body
          end

          # Circuit Types
          def list_circuit_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/circuits/circuit-types/', params)
            resp.body
          end

          def get_circuit_type(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/circuits/circuit-types/#{id}/")
            resp.body
          end

          def create_circuit_type(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/circuits/circuit-types/', attrs)
            resp.body
          end

          # Circuits
          def list_circuits(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/circuits/circuits/', params)
            resp.body
          end

          def get_circuit(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/circuits/circuits/#{id}/")
            resp.body
          end

          def create_circuit(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/circuits/circuits/', attrs)
            resp.body
          end

          def update_circuit(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/circuits/circuits/#{id}/", attrs)
            resp.body
          end

          def delete_circuit(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/circuits/circuits/#{id}/")
          end

          # Circuit Terminations
          def list_circuit_terminations(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/circuits/circuit-terminations/', params)
            resp.body
          end

          def get_circuit_termination(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/circuits/circuit-terminations/#{id}/")
            resp.body
          end

          def create_circuit_termination(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/circuits/circuit-terminations/', attrs)
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
