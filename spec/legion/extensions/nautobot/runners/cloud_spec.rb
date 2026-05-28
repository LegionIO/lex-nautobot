# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Cloud do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Cloud
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

  describe '#list_cloud_accounts' do
    it 'calls GET /api/cloud/cloud-accounts/' do
      runner.list_cloud_accounts
      expect(fake_conn).to have_received(:get).with('/api/cloud/cloud-accounts/', {})
    end
  end

  describe '#create_cloud_account' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_cloud_account(name: 'aws-prod', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_cloud_networks' do
    it 'calls GET /api/cloud/cloud-networks/' do
      runner.list_cloud_networks
      expect(fake_conn).to have_received(:get).with('/api/cloud/cloud-networks/', {})
    end
  end

  describe '#list_cloud_services' do
    it 'calls GET /api/cloud/cloud-services/' do
      runner.list_cloud_services
      expect(fake_conn).to have_received(:get).with('/api/cloud/cloud-services/', {})
    end
  end

  describe '#list_cloud_resource_types' do
    it 'calls GET /api/cloud/cloud-resource-types/' do
      runner.list_cloud_resource_types
      expect(fake_conn).to have_received(:get).with('/api/cloud/cloud-resource-types/', {})
    end
  end
end
