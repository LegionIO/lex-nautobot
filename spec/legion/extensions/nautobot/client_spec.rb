# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Client do
  let(:client) { described_class.new(url: 'https://nautobot.example.com', token: 'test-token') }

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
    allow(Faraday).to receive(:new).and_return(fake_conn)
  end

  it 'includes all runner modules' do
    expect(client).to respond_to(:list_devices)
    expect(client).to respond_to(:list_prefixes)
    expect(client).to respond_to(:list_circuits)
    expect(client).to respond_to(:list_tenants)
    expect(client).to respond_to(:list_virtual_machines)
    expect(client).to respond_to(:list_tags)
    expect(client).to respond_to(:list_users)
    expect(client).to respond_to(:list_cloud_accounts)
    expect(client).to respond_to(:list_vpns)
    expect(client).to respond_to(:list_radio_profiles)
  end

  it 'stores opts' do
    expect(client.opts).to include(url: 'https://nautobot.example.com', token: 'test-token')
  end

  it 'defaults read_only to false' do
    expect(client.opts[:read_only]).to be false
  end

  describe 'read_only mode' do
    let(:ro_client) { described_class.new(url: 'https://nautobot.example.com', token: 'x', read_only: true) }

    it 'stores read_only in opts' do
      expect(ro_client.opts[:read_only]).to be true
    end
  end
end
