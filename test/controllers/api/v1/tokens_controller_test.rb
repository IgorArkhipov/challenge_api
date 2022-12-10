# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class TokensControllerTest < ActionDispatch::IntegrationTest
      setup do
        @client = clients(:one)
      end

      test 'should get authentication token' do
        post api_v1_tokens_url, params: { client: { email: @client.email, password: 'accepted_pass' } },
                                as: :json
        assert_response :success

        json_response = JSON.parse(response.body)
        assert_not_nil json_response['token']
      end

      test 'should not get authentication token' do
        post api_v1_tokens_url, params: { client: { email: @client.email, password: 'denied_pass' } },
                                as: :json
        assert_response :unauthorized
      end
    end
  end
end
