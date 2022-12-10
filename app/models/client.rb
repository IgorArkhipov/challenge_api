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
class Client < ApplicationRecord
  has_secure_password

  validates :email, format: /@/, uniqueness: true
  validates :password_digest, presence: true
end
