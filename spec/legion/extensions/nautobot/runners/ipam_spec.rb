# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Ipam do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Ipam
    end
  end

  let(:runner) { runner_class.new }

  let(:fake_response) do
    resp = double('FaradayResponse')
    allow(resp).to receive(:body).and_return({ 'results' => [] })
    resp
  end

  let(:fake_conn) do
    conn = double('FaradayConnection')
    allow(conn).to receive(:get).and_return(fake_response)
    allow(conn).to receive(:post).and_return(fake_response)
    allow(conn).to receive(:patch).and_return(fake_response)
    allow(conn).to receive(:delete).and_return(fake_response)
    conn
  end

  before do
    allow(runner).to receive(:connection).and_return(fake_conn)
  end

  describe '#list_prefixes' do
    it 'calls GET /api/ipam/prefixes/' do
      runner.list_prefixes
      expect(fake_conn).to have_received(:get).with('/api/ipam/prefixes/', {})
    end

    it 'passes filter params' do
      runner.list_prefixes(vrf: 'uuid-1')
      expect(fake_conn).to have_received(:get).with('/api/ipam/prefixes/', hash_including(vrf: 'uuid-1'))
    end
  end

  describe '#get_prefix' do
    it 'calls GET /api/ipam/prefixes/:id/' do
      runner.get_prefix(id: 'prefix-uuid')
      expect(fake_conn).to have_received(:get).with('/api/ipam/prefixes/prefix-uuid/')
    end
  end

  describe '#create_prefix' do
    it 'calls POST /api/ipam/prefixes/' do
      runner.create_prefix(prefix: '10.0.0.0/24', namespace: 'uuid-1', status: 'active')
      expect(fake_conn).to have_received(:post).with('/api/ipam/prefixes/', hash_including(prefix: '10.0.0.0/24'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_prefix(prefix: '10.0.0.0/24', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_ip_addresses' do
    it 'calls GET /api/ipam/ip-addresses/' do
      runner.list_ip_addresses
      expect(fake_conn).to have_received(:get).with('/api/ipam/ip-addresses/', {})
    end
  end

  describe '#create_ip_address' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_ip_address(address: '10.0.0.1/32', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_vlans' do
    it 'calls GET /api/ipam/vlans/' do
      runner.list_vlans
      expect(fake_conn).to have_received(:get).with('/api/ipam/vlans/', {})
    end
  end

  describe '#list_vrfs' do
    it 'calls GET /api/ipam/vrfs/' do
      runner.list_vrfs
      expect(fake_conn).to have_received(:get).with('/api/ipam/vrfs/', {})
    end
  end

  describe '#list_namespaces' do
    it 'calls GET /api/ipam/namespaces/' do
      runner.list_namespaces
      expect(fake_conn).to have_received(:get).with('/api/ipam/namespaces/', {})
    end
  end

  describe '#list_services' do
    it 'calls GET /api/ipam/services/' do
      runner.list_services
      expect(fake_conn).to have_received(:get).with('/api/ipam/services/', {})
    end
  end
end
