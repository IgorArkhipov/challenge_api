# frozen_string_literal: true

module Authenticable
  def authorized_client
    return @authorized_client if @authorized_client

    header = request.headers['Authorization']

    return nil if header.nil?

    decoded = AuthToken.decode(header)
    @authorized_client = Client.find(decoded[:client_id])
  rescue ActiveRecord::RecordNotFound
    nil
  end
end
