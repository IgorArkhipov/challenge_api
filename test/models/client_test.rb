# frozen_string_literal: true

require 'test_helper'

class ClientTest < ActiveSupport::TestCase
  test 'client with valid email' do
    client = Client.new(email: 'test_client@api', password_digest: 'test')
    assert client.valid?
  end

  test 'client with invalid email' do
    client = Client.new(email: 'test_client', password_digest: 'test')
    assert_not client.valid?
  end

  test 'client with repeating email' do
    original_client = clients(:one)
    client = Client.new(email: original_client.email, password_digest: 'test')
    assert_not client.valid?
  end
end
