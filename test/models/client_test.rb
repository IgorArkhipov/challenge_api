# frozen_string_literal: true

# == Schema Information
#
# Table name: clients
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_clients_on_email  (email) UNIQUE
#
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
