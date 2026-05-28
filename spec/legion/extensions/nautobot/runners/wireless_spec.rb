# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Wireless do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Wireless
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
    conn
  end

  before do
    allow(runner).to receive(:connection).and_return(fake_conn)
  end

  describe '#list_radio_profiles' do
    it 'calls GET /api/wireless/radio-profiles/' do
      runner.list_radio_profiles
      expect(fake_conn).to have_received(:get).with('/api/wireless/radio-profiles/', {})
    end
  end

  describe '#list_wireless_networks' do
    it 'calls GET /api/wireless/wireless-networks/' do
      runner.list_wireless_networks
      expect(fake_conn).to have_received(:get).with('/api/wireless/wireless-networks/', {})
    end
  end

  describe '#create_wireless_network' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_wireless_network(ssid: 'corp-wifi', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_supported_data_rates' do
    it 'calls GET /api/wireless/supported-data-rates/' do
      runner.list_supported_data_rates
      expect(fake_conn).to have_received(:get).with('/api/wireless/supported-data-rates/', {})
    end
  end
end
