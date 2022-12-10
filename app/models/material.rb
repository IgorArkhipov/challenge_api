# frozen_string_literal: true

# == Schema Information
#
# Table name: materials
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_materials_on_name  (name) UNIQUE
#
class Material < ApplicationRecord
  has_many :material_relations, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
