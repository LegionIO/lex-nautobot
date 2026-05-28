# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Vpn do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Vpn
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

  describe '#list_vpns' do
    it 'calls GET /api/vpn/vpns/' do
      runner.list_vpns
      expect(fake_conn).to have_received(:get).with('/api/vpn/vpns/', {})
    end
  end

  describe '#create_vpn' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_vpn(name: 'site-vpn', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_vpn_tunnels' do
    it 'calls GET /api/vpn/vpn-tunnels/' do
      runner.list_vpn_tunnels
      expect(fake_conn).to have_received(:get).with('/api/vpn/vpn-tunnels/', {})
    end
  end

  describe '#list_vpn_profiles' do
    it 'calls GET /api/vpn/vpn-profiles/' do
      runner.list_vpn_profiles
      expect(fake_conn).to have_received(:get).with('/api/vpn/vpn-profiles/', {})
    end
  end

  describe '#list_vpn_terminations' do
    it 'calls GET /api/vpn/vpn-terminations/' do
      runner.list_vpn_terminations
      expect(fake_conn).to have_received(:get).with('/api/vpn/vpn-terminations/', {})
    end
  end
end
