# lex-nautobot

Legion Extension for [Nautobot](https://github.com/nautobot/nautobot) — a network source of truth and automation platform.

## Installation

```ruby
gem 'lex-nautobot'
```

## Usage

```ruby
client = Legion::Extensions::Nautobot::Client.new(
  url: 'https://nautobot.example.com',
  token: 'your-api-token'
)

# DCIM
client.list_devices
client.get_device(id: 'uuid')
client.create_device(name: 'switch-01', device_type: 'uuid', location: 'uuid', status: 'active')

# IPAM
client.list_prefixes
client.list_ip_addresses(namespace: 'uuid')
client.create_prefix(prefix: '10.0.0.0/24', namespace: 'uuid', status: 'active')

# Circuits
client.list_circuits
client.list_providers

# Virtualization
client.list_virtual_machines
client.list_clusters

# Extras
client.list_jobs
client.run_job(id: 'job-uuid', data: { key: 'value' })
client.graphql_query(query: '{ devices { name } }')

# Cloud, VPN, Wireless
client.list_cloud_accounts
client.list_vpn_tunnels
client.list_wireless_networks
```

### Read-Only Mode

```ruby
client = Legion::Extensions::Nautobot::Client.new(
  url: 'https://nautobot.example.com',
  token: 'your-api-token',
  read_only: true
)

client.list_devices          # works
client.create_device(...)    # raises ReadOnlyError
```

## Runners

| Runner | Nautobot App | Key Resources |
|--------|-------------|---------------|
| Dcim | `/api/dcim/` | devices, locations, racks, interfaces, cables, manufacturers |
| Ipam | `/api/ipam/` | prefixes, IP addresses, VLANs, VRFs, namespaces |
| Circuits | `/api/circuits/` | providers, circuits, circuit types, terminations |
| Tenancy | `/api/tenancy/` | tenants, tenant groups |
| Virtualization | `/api/virtualization/` | clusters, virtual machines, VM interfaces |
| Extras | `/api/extras/` | tags, statuses, jobs, config contexts, webhooks, GraphQL |
| Users | `/api/users/` | users, groups, tokens, permissions |
| Cloud | `/api/cloud/` | cloud accounts, networks, services |
| Vpn | `/api/vpn/` | VPNs, tunnels, profiles, terminations |
| Wireless | `/api/wireless/` | radio profiles, wireless networks |

## License

MIT
