# frozen_string_literal: true

class Client < ApplicationRecord
  has_secure_password

  validates :email, format: /@/, uniqueness: true
  validates :password_digest, presence: true
end
