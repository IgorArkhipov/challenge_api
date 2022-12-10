# frozen_string_literal: true

require 'test_helper'

class MockedController
  include Authenticable
  attr_accessor :request

  def initialize
    mocked_request = Struct.new(:headers)
    self.request = mocked_request.new({})
  end
end

class AuthenticableTest < ActionDispatch::IntegrationTest
  setup do
    @client = clients(:one)
    @authentication = MockedController.new
  end

  test 'should get client from existing request header attribute' do
    @authentication.request.headers['Authorization'] = AuthToken.encode(client_id: @client.id)
    assert_not_nil @authentication.authorized_client
    assert_equal @client.id, @authentication.authorized_client.id
  end

  test 'should not get client from empty request header' do
    @authentication.request.headers['Authorization'] = nil
    assert_nil @authentication.authorized_client
  end
end
