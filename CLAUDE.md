# lex-nautobot

Legion Extension connecting LegionIO to Nautobot — a network source of truth and automation platform. Provides runners for all major Nautobot API apps: DCIM, IPAM, Circuits, Tenancy, Virtualization, Extras, Users, Cloud, VPN, and Wireless.

## Architecture

```
Legion::Extensions::Nautobot
├── Runners/
│   ├── Dcim            # Devices, locations, racks, interfaces, cables, manufacturers, platforms, etc.
│   ├── Ipam            # Prefixes, IP addresses, VLANs, VRFs, namespaces, services
│   ├── Circuits        # Providers, circuits, circuit types, terminations
│   ├── Tenancy         # Tenants, tenant groups
│   ├── Virtualization  # Clusters, virtual machines, VM interfaces
│   ├── Extras          # Tags, statuses, jobs, config contexts, git repos, webhooks, GraphQL
│   ├── Users           # Users, groups, tokens, permissions
│   ├── Cloud           # Cloud accounts, networks, services, resource types
│   ├── Vpn             # VPNs, tunnels, endpoints, profiles, terminations
│   └── Wireless        # Radio profiles, wireless networks, data rates
├── Helpers/Client      # Faraday connection (Token auth)
├── Errors              # ReadOnlyError
└── Client              # Standalone client class
```

## Key Design Decisions

- Nautobot uses `Token` auth (not Bearer) — header is `Authorization: Token <token>`
- Nautobot uses UUIDs for all object IDs
- API responses use `results` array (paginated) unlike TFE's JSON:API `data` array
- All endpoints use trailing slashes (Nautobot/Django convention)
- **Read-Only Guard**: write operations raise `ReadOnlyError` when `read_only: true`
- No default URL — must be provided (unlike TFE which defaults to app.terraform.io)
- Depends on `faraday` (>= 2.0)
