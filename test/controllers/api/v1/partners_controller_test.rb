# frozen_string_literal: true

require 'test_helper'

module Api
  module V1
    class PartnersControllerTest < ActionDispatch::IntegrationTest
      setup do
        @client = clients(:one)
        @partner = partners(:one)
      end

      test 'should show partner collection data' do
        get api_v1_partners_url,
            headers: { Authorization: AuthToken.encode(client_id: @client.id) },
            as: :json
        assert_response :success
      end

      test 'should show partner data' do
        get api_v1_partner_url(@partner),
            headers: { Authorization: AuthToken.encode(client_id: @client.id) },
            as: :json
        assert_response :success

        json_response = JSON.parse(response.body)
        assert_equal @partner.name, json_response['name']
        assert_equal @partner.latitude.to_s, json_response['latitude']
        assert_equal @partner.longitude.to_s, json_response['longitude']
        assert_equal @partner.operating_radius.to_s, json_response['operating_radius']
        assert_equal @partner.rating, json_response['rating']
      end

      test 'should match partners with provided requirements when authorized' do
        post match_api_v1_partners_url, params: { requirements: {
          material: ['wood'], address: '', square_size: 25.6, phone_number: '0142444'
        } }, headers: { Authorization: AuthToken.encode(client_id: @client.id) }, as: :json
        assert_response :success
      end

      test 'should prohibit matching partners without authorization' do
        post match_api_v1_partners_url, params: { requirements: {
          material: ['tiles'], address: '', square_size: 25.6, phone_number: '0142444'
        } }, as: :json
        assert_response :forbidden
      end
    end
  end
end
