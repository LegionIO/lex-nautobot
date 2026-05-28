# Changelog

## [0.1.0] - 2026-05-28

### Added
- Initial release
- DCIM runner (devices, locations, racks, interfaces, cables, manufacturers, platforms, virtual chassis, controllers, software)
- IPAM runner (prefixes, IP addresses, VLANs, VRFs, namespaces, services, route targets, RIRs)
- Circuits runner (providers, circuits, circuit types, circuit terminations, provider networks)
- Tenancy runner (tenants, tenant groups)
- Virtualization runner (clusters, cluster types, cluster groups, virtual machines, VM interfaces)
- Extras runner (tags, statuses, roles, custom fields, config contexts, dynamic groups, git repos, jobs, secrets, relationships, webhooks, GraphQL, contacts, teams, external integrations)
- Users runner (users, groups, tokens, permissions)
- Cloud runner (cloud accounts, cloud networks, cloud services, cloud resource types)
- VPN runner (VPNs, VPN tunnels, VPN tunnel endpoints, VPN profiles, VPN terminations)
- Wireless runner (radio profiles, wireless networks, supported data rates)
- Standalone Client class with read_only guard
- Token-based authentication via Faraday
