# frozen_string_literal: true

class Requirement
  include ActiveModel::Model

  attr_accessor :material, :latitude, :longitude

  validates :material, presence: true
  validates :latitude, presence: true,
                       numericality: { greater_than_or_equal_to: -90.0, less_than_or_equal_to: 90.0 }
  validates :longitude, presence: true,
                        numericality: { greater_than_or_equal_to: -180.0, less_than_or_equal_to: 180.0 }

  validate :uniform_array, if: :material

  private

  def uniform_array
    errors.add(:material, 'not uniform') unless material.is_a?(Array) && material.all? { |mat| mat.is_a?(String) }
  end
end
