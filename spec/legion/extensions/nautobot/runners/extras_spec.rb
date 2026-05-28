# frozen_string_literal: true

require 'spec_helper'
require 'faraday'

RSpec.describe Legion::Extensions::Nautobot::Runners::Extras do
  let(:runner_class) do
    Class.new do
      include Legion::Extensions::Nautobot::Runners::Extras
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

  describe '#list_tags' do
    it 'calls GET /api/extras/tags/' do
      runner.list_tags
      expect(fake_conn).to have_received(:get).with('/api/extras/tags/', {})
    end
  end

  describe '#list_statuses' do
    it 'calls GET /api/extras/statuses/' do
      runner.list_statuses
      expect(fake_conn).to have_received(:get).with('/api/extras/statuses/', {})
    end
  end

  describe '#list_jobs' do
    it 'calls GET /api/extras/jobs/' do
      runner.list_jobs
      expect(fake_conn).to have_received(:get).with('/api/extras/jobs/', {})
    end
  end

  describe '#run_job' do
    it 'calls POST /api/extras/jobs/:id/run/' do
      runner.run_job(id: 'job-uuid', data: { key: 'value' })
      expect(fake_conn).to have_received(:post).with('/api/extras/jobs/job-uuid/run/', hash_including(data: { key: 'value' }))
    end

    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.run_job(id: 'job-uuid', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#list_config_contexts' do
    it 'calls GET /api/extras/config-contexts/' do
      runner.list_config_contexts
      expect(fake_conn).to have_received(:get).with('/api/extras/config-contexts/', {})
    end
  end

  describe '#list_git_repositories' do
    it 'calls GET /api/extras/git-repositories/' do
      runner.list_git_repositories
      expect(fake_conn).to have_received(:get).with('/api/extras/git-repositories/', {})
    end
  end

  describe '#sync_git_repository' do
    it 'raises ReadOnlyError when read_only is true' do
      expect { runner.sync_git_repository(id: 'repo-uuid', read_only: true) }
        .to raise_error(Legion::Extensions::Nautobot::ReadOnlyError)
    end
  end

  describe '#graphql_query' do
    it 'calls POST /api/graphql/' do
      runner.graphql_query(query: '{ devices { name } }')
      expect(fake_conn).to have_received(:post).with('/api/graphql/', hash_including(query: '{ devices { name } }'))
    end
  end

  describe '#list_webhooks' do
    it 'calls GET /api/extras/webhooks/' do
      runner.list_webhooks
      expect(fake_conn).to have_received(:get).with('/api/extras/webhooks/', {})
    end
  end

  describe '#list_secrets' do
    it 'calls GET /api/extras/secrets/' do
      runner.list_secrets
      expect(fake_conn).to have_received(:get).with('/api/extras/secrets/', {})
    end
  end
end
