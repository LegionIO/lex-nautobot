# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Dcim do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Dcim
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

  describe '#list_devices' do
    it 'calls GET /api/dcim/devices/' do
      runner.list_devices
      expect(fake_conn).to have_received(:get).with('/api/dcim/devices/', {})
    end

    it 'passes filter params' do
      runner.list_devices(location: 'dc1')
      expect(fake_conn).to have_received(:get).with('/api/dcim/devices/', hash_including(location: 'dc1'))
    end

    it 'returns the response body' do
      result = runner.list_devices
      expect(result).to eq({ 'results' => [] })
    end
  end

  describe '#get_device' do
    it 'calls GET /api/dcim/devices/:id/' do
      runner.get_device(id: 'abc-123')
      expect(fake_conn).to have_received(:get).with('/api/dcim/devices/abc-123/')
    end
  end

  describe '#create_device' do
    it 'calls POST /api/dcim/devices/' do
      runner.create_device(name: 'switch-01', device_type: 'uuid-1', location: 'uuid-2', status: 'active')
      expect(fake_conn).to have_received(:post).with('/api/dcim/devices/', hash_including(name: 'switch-01'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_device(name: 'x', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#update_device' do
    it 'calls PATCH /api/dcim/devices/:id/' do
      runner.update_device(id: 'abc-123', name: 'updated')
      expect(fake_conn).to have_received(:patch).with('/api/dcim/devices/abc-123/', hash_including(name: 'updated'))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.update_device(id: 'abc-123', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#delete_device' do
    it 'calls DELETE /api/dcim/devices/:id/' do
      runner.delete_device(id: 'abc-123')
      expect(fake_conn).to have_received(:delete).with('/api/dcim/devices/abc-123/')
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.delete_device(id: 'abc-123', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_locations' do
    it 'calls GET /api/dcim/locations/' do
      runner.list_locations
      expect(fake_conn).to have_received(:get).with('/api/dcim/locations/', {})
    end
  end

  describe '#list_interfaces' do
    it 'calls GET /api/dcim/interfaces/' do
      runner.list_interfaces
      expect(fake_conn).to have_received(:get).with('/api/dcim/interfaces/', {})
    end
  end

  describe '#list_racks' do
    it 'calls GET /api/dcim/racks/' do
      runner.list_racks
      expect(fake_conn).to have_received(:get).with('/api/dcim/racks/', {})
    end
  end

  describe '#list_cables' do
    it 'calls GET /api/dcim/cables/' do
      runner.list_cables
      expect(fake_conn).to have_received(:get).with('/api/dcim/cables/', {})
    end
  end

  describe '#list_manufacturers' do
    it 'calls GET /api/dcim/manufacturers/' do
      runner.list_manufacturers
      expect(fake_conn).to have_received(:get).with('/api/dcim/manufacturers/', {})
    end
  end
end
