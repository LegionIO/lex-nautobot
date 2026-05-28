# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Tenancy do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Tenancy
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

  describe '#list_tenants' do
    it 'calls GET /api/tenancy/tenants/' do
      runner.list_tenants
      expect(fake_conn).to have_received(:get).with('/api/tenancy/tenants/', {})
    end
  end

  describe '#get_tenant' do
    it 'calls GET /api/tenancy/tenants/:id/' do
      runner.get_tenant(id: 'tenant-uuid')
      expect(fake_conn).to have_received(:get).with('/api/tenancy/tenants/tenant-uuid/')
    end
  end

  describe '#create_tenant' do
    it 'calls POST /api/tenancy/tenants/' do
      runner.create_tenant(name: 'Acme Corp')
      expect(fake_conn).to have_received(:post).with('/api/tenancy/tenants/', hash_including(name: 'Acme Corp'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_tenant(name: 'Acme', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_tenant_groups' do
    it 'calls GET /api/tenancy/tenant-groups/' do
      runner.list_tenant_groups
      expect(fake_conn).to have_received(:get).with('/api/tenancy/tenant-groups/', {})
    end
  end

  describe '#delete_tenant' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.delete_tenant(id: 'uuid', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end
end
