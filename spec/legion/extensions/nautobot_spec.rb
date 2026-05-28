# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Legion::Extensions::Nautobot do
  it 'has a version number' do
    expect(Legion::Extensions::Nautobot::VERSION).not_to be_nil
  end

  it 'defines ReadOnlyError' do
    expect(Legion::Extensions::Nautobot::ReadOnlyError).to be < StandardError
  end
end
