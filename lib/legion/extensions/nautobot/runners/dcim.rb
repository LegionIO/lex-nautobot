# frozen_string_literal: true

require 'legion/extensions/nautobot/helpers/client'

module Legion
  module Extensions
    module Nautobot
      module Runners
        module Dcim
          include Legion::Extensions::Nautobot::Helpers::Client

          # Locations
          def list_location_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/location-types/', params)
            resp.body
          end

          def get_location_type(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/location-types/#{id}/")
            resp.body
          end

          def create_location_type(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/location-types/', attrs)
            resp.body
          end

          def list_locations(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/locations/', params)
            resp.body
          end

          def get_location(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/locations/#{id}/")
            resp.body
          end

          def create_location(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/locations/', attrs)
            resp.body
          end

          def update_location(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/dcim/locations/#{id}/", attrs)
            resp.body
          end

          def delete_location(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/dcim/locations/#{id}/")
          end

          # Racks
          def list_rack_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/rack-groups/', params)
            resp.body
          end

          def list_racks(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/racks/', params)
            resp.body
          end

          def get_rack(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/racks/#{id}/")
            resp.body
          end

          def create_rack(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/racks/', attrs)
            resp.body
          end

          def update_rack(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/dcim/racks/#{id}/", attrs)
            resp.body
          end

          def delete_rack(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/dcim/racks/#{id}/")
          end

          def list_rack_reservations(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/rack-reservations/', params)
            resp.body
          end

          # Manufacturers & Device Types
          def list_manufacturers(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/manufacturers/', params)
            resp.body
          end

          def get_manufacturer(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/manufacturers/#{id}/")
            resp.body
          end

          def create_manufacturer(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/manufacturers/', attrs)
            resp.body
          end

          def list_device_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/device-types/', params)
            resp.body
          end

          def get_device_type(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/device-types/#{id}/")
            resp.body
          end

          def create_device_type(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/device-types/', attrs)
            resp.body
          end

          def list_device_families(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/device-families/', params)
            resp.body
          end

          def list_module_types(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/module-types/', params)
            resp.body
          end

          # Platforms
          def list_platforms(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/platforms/', params)
            resp.body
          end

          def get_platform(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/platforms/#{id}/")
            resp.body
          end

          def create_platform(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/platforms/', attrs)
            resp.body
          end

          # Devices
          def list_devices(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/devices/', params)
            resp.body
          end

          def get_device(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/devices/#{id}/")
            resp.body
          end

          def create_device(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/devices/', attrs)
            resp.body
          end

          def update_device(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/dcim/devices/#{id}/", attrs)
            resp.body
          end

          def delete_device(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/dcim/devices/#{id}/")
          end

          # Interfaces
          def list_interfaces(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/interfaces/', params)
            resp.body
          end

          def get_interface(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/interfaces/#{id}/")
            resp.body
          end

          def create_interface(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/interfaces/', attrs)
            resp.body
          end

          def update_interface(id:, url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).patch("/api/dcim/interfaces/#{id}/", attrs)
            resp.body
          end

          def delete_interface(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/dcim/interfaces/#{id}/")
          end

          # Cables
          def list_cables(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/cables/', params)
            resp.body
          end

          def get_cable(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/cables/#{id}/")
            resp.body
          end

          def create_cable(url: nil, token: nil, read_only: false, **attrs)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            resp = connection(url: url, token: token).post('/api/dcim/cables/', attrs)
            resp.body
          end

          def delete_cable(id:, url: nil, token: nil, read_only: false, **)
            raise ReadOnlyError, 'Write operations disabled (read_only mode)' if read_only

            connection(url: url, token: token).delete("/api/dcim/cables/#{id}/")
          end

          # Console & Power Ports
          def list_console_ports(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/console-ports/', params)
            resp.body
          end

          def list_console_server_ports(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/console-server-ports/', params)
            resp.body
          end

          def list_power_ports(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/power-ports/', params)
            resp.body
          end

          def list_power_outlets(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/power-outlets/', params)
            resp.body
          end

          def list_power_panels(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/power-panels/', params)
            resp.body
          end

          def list_power_feeds(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/power-feeds/', params)
            resp.body
          end

          # Front/Rear Ports & Device Bays
          def list_front_ports(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/front-ports/', params)
            resp.body
          end

          def list_rear_ports(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/rear-ports/', params)
            resp.body
          end

          def list_device_bays(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/device-bays/', params)
            resp.body
          end

          def list_inventory_items(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/inventory-items/', params)
            resp.body
          end

          # Virtual Chassis & Redundancy
          def list_virtual_chassis(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/virtual-chassis/', params)
            resp.body
          end

          def get_virtual_chassis(id:, url: nil, token: nil, **)
            resp = connection(url: url, token: token).get("/api/dcim/virtual-chassis/#{id}/")
            resp.body
          end

          def list_device_redundancy_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/device-redundancy-groups/', params)
            resp.body
          end

          def list_interface_redundancy_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/interface-redundancy-groups/', params)
            resp.body
          end

          # Software
          def list_software_versions(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/software-versions/', params)
            resp.body
          end

          def list_software_image_files(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/software-image-files/', params)
            resp.body
          end

          # Controllers
          def list_controllers(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/controllers/', params)
            resp.body
          end

          def list_controller_managed_device_groups(url: nil, token: nil, **params)
            resp = connection(url: url, token: token).get('/api/dcim/controller-managed-device-groups/', params)
            resp.body
          end

          include Legion::Extensions::Helpers::Lex if Legion::Extensions.const_defined?(:Helpers, false) &&
                                                      Legion::Extensions::Helpers.const_defined?(:Lex, false)
        end
      end
    end
  end
end
