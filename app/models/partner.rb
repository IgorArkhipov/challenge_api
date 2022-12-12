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
                       numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, presence: true,
                        numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }
  validates :name, presence: true
  validates :operating_radius, presence: true, numericality: { greater_than: 1.0 }
  validates :rating, allow_nil: true, numericality: { greater_than_or_equal_to: 0.0, less_than_or_equal_to: 10.0 }

  scope :in_area, lambda { |lat, long|
    cos_lat2 = Math.cos(lat * Math::PI / 180)**2
    query = "(((#{lat}-latitude)*(#{lat}-latitude))+((#{long}-longitude)*#{cos_lat2}*(#{long}-longitude)*#{cos_lat2}))"
    where(Arel.sql("#{query}<((operating_radius/111)*(operating_radius/111))"))
      .order(Arel.sql("#{query} ASC"))
  }
end
