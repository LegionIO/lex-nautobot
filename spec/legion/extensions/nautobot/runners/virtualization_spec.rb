# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Virtualization do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Virtualization
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

  describe '#list_clusters' do
    it 'calls GET /api/virtualization/clusters/' do
      runner.list_clusters
      expect(fake_conn).to have_received(:get).with('/api/virtualization/clusters/', {})
    end
  end

  describe '#list_virtual_machines' do
    it 'calls GET /api/virtualization/virtual-machines/' do
      runner.list_virtual_machines
      expect(fake_conn).to have_received(:get).with('/api/virtualization/virtual-machines/', {})
    end
  end

  describe '#create_virtual_machine' do
    it 'calls POST /api/virtualization/virtual-machines/' do
      runner.create_virtual_machine(name: 'vm-01', cluster: 'uuid-1', status: 'active')
      expect(fake_conn).to have_received(:post).with('/api/virtualization/virtual-machines/',
                                                     hash_including(name: 'vm-01'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_virtual_machine(name: 'vm-01', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_cluster_types' do
    it 'calls GET /api/virtualization/cluster-types/' do
      runner.list_cluster_types
      expect(fake_conn).to have_received(:get).with('/api/virtualization/cluster-types/', {})
    end
  end

  describe '#list_vm_interfaces' do
    it 'calls GET /api/virtualization/interfaces/' do
      runner.list_vm_interfaces
      expect(fake_conn).to have_received(:get).with('/api/virtualization/interfaces/', {})
    end
  end
end
