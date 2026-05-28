# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Users do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Users
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

  describe '#list_users' do
    it 'calls GET /api/users/users/' do
      runner.list_users
      expect(fake_conn).to have_received(:get).with('/api/users/users/', {})
    end
  end

  describe '#get_user' do
    it 'calls GET /api/users/users/:id/' do
      runner.get_user(id: 'user-uuid')
      expect(fake_conn).to have_received(:get).with('/api/users/users/user-uuid/')
    end
  end

  describe '#create_user' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.create_user(username: 'jdoe', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_groups' do
    it 'calls GET /api/users/groups/' do
      runner.list_groups
      expect(fake_conn).to have_received(:get).with('/api/users/groups/', {})
    end
  end

  describe '#list_permissions' do
    it 'calls GET /api/users/permissions/' do
      runner.list_permissions
      expect(fake_conn).to have_received(:get).with('/api/users/permissions/', {})
    end
  end
end
