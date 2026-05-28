# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Virtualization
          include Legion::Extensions::Nautobot::Helpers::Client

          # Cluster Types
          def list_cluster_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/virtualization/cluster-types/', params)
            resp.body
          end

          def get_cluster_type(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/virtualization/cluster-types/#{id}/")
            resp.body
          end

          def create_cluster_type(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/virtualization/cluster-types/', attrs)
            resp.body
          end

          # Cluster Groups
          def list_cluster_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/virtualization/cluster-groups/', params)
            resp.body
          end

          def get_cluster_group(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/virtualization/cluster-groups/#{id}/")
            resp.body
          end

          def create_cluster_group(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/virtualization/cluster-groups/', attrs)
            resp.body
          end

          # Clusters
          def list_clusters(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/virtualization/clusters/', params)
            resp.body
          end

          def get_cluster(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/virtualization/clusters/#{id}/")
            resp.body
          end

          def create_cluster(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/virtualization/clusters/', attrs)
            resp.body
          end

          def update_cluster(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/virtualization/clusters/#{id}/", attrs)
            resp.body
          end

          def delete_cluster(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/virtualization/clusters/#{id}/")
          end

          # Virtual Machines
          def list_virtual_machines(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/virtualization/virtual-machines/', params)
            resp.body
          end

          def get_virtual_machine(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/virtualization/virtual-machines/#{id}/")
            resp.body
          end

          def create_virtual_machine(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/virtualization/virtual-machines/', attrs)
            resp.body
          end

          def update_virtual_machine(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/virtualization/virtual-machines/#{id}/", attrs)
            resp.body
          end

          def delete_virtual_machine(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/virtualization/virtual-machines/#{id}/")
          end

          # VM Interfaces
          def list_vm_interfaces(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/virtualization/interfaces/', params)
            resp.body
          end

          def get_vm_interface(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/virtualization/interfaces/#{id}/")
            resp.body
          end

          def create_vm_interface(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/virtualization/interfaces/', attrs)
            resp.body
          end

          def update_vm_interface(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/virtualization/interfaces/#{id}/", attrs)
            resp.body
          end

          def delete_vm_interface(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/virtualization/interfaces/#{id}/")
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
