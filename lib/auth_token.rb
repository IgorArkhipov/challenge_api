# frozen_string_literal: true

class AuthToken
  SECRET = 'challenge_secret'

  def self.encode(payload, expire = 8.hours.from_now)
    payload[:exp] = expire.to_i
    JWT.encode(payload, SECRET)
  end

  def self.decode(token)
    decoded = JWT.decode(token, SECRET).first
    decoded.with_indifferent_access
  end
end
