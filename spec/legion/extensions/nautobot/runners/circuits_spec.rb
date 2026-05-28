# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Circuits do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Circuits
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

  describe '#list_providers' do
    it 'calls GET /api/circuits/providers/' do
      runner.list_providers
      expect(fake_conn).to have_received(:get).with('/api/circuits/providers/', {})
    end
  end

  describe '#get_provider' do
    it 'calls GET /api/circuits/providers/:id/' do
      runner.get_provider(id: 'prov-uuid')
      expect(fake_conn).to have_received(:get).with('/api/circuits/providers/prov-uuid/')
    end
  end

  describe '#create_provider' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_provider(name: 'ISP', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_circuits' do
    it 'calls GET /api/circuits/circuits/' do
      runner.list_circuits
      expect(fake_conn).to have_received(:get).with('/api/circuits/circuits/', {})
    end
  end

  describe '#create_circuit' do
    it 'calls POST /api/circuits/circuits/' do
      runner.create_circuit(cid: 'CKT-001', provider: 'uuid-1', circuit_type: 'uuid-2', status: 'active')
      expect(fake_conn).to have_received(:post).with('/api/circuits/circuits/', hash_including(cid: 'CKT-001'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_circuit(cid: 'CKT-001', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_circuit_terminations' do
    it 'calls GET /api/circuits/circuit-terminations/' do
      runner.list_circuit_terminations
      expect(fake_conn).to have_received(:get).with('/api/circuits/circuit-terminations/', {})
    end
  end
end
