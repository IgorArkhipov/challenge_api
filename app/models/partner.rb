# frozen_string_literal: true

# == Schema Information
#
# Table name: partners
#
#  id               :integer          not null, primary key
#  latitude         :decimal(10, 6)   not null
#  longitude        :decimal(10, 6)   not null
#  name             :string           not null
#  operating_radius :decimal(6, 3)    not null
#  rating           :float
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#
class Partner < ApplicationRecord
  has_many :material_relations, dependent: :destroy
  has_many :experienced_materials, through: :material_relations, source: :material

  validates :latitude, presence: true,
                       numericality: { greater_than_or_equal_to: -90, less_than_or_equal_to: 90 }
  validates :longitude, presence: true,
                        numericality: { greater_than_or_equal_to: -180, less_than_or_equal_to: 180 }
  validates :name, presence: true
  validates :operating_radius, presence: true, numericality: { greater_than: 0 }
  validates :rating, allow_nil: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
