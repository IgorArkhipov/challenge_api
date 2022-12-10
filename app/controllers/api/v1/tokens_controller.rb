# frozen_string_literal: true

module Api
  module V1
    class TokensController < ApplicationController
      def create
        @client = Client.find_by(email: allowed_params[:email])

        if @client&.authenticate(allowed_params[:password])
          render json: {
            token: AuthToken.encode(client_id: @client.id),
            email: @client.email
          }
        else
          head :unauthorized
        end
      end

      private

      def allowed_params
        params.require(:client).permit(:email, :password)
      end
    end
  end
end
