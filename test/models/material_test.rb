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
require 'test_helper'

class MaterialTest < ActiveSupport::TestCase
  test 'should remove referenced material relations on destroy' do
    assert_difference('MaterialRelation.count', -1) do
      materials(:three).destroy
    end
  end

  test 'material with repeating name' do
    original_material = materials(:three)
    material = Material.new(name: original_material.name)
    assert_not material.valid?
  end
end
