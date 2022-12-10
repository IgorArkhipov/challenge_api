# frozen_string_literal: true

# == Schema Information
#
# Table name: material_relations
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  material_id :integer          not null
#  partner_id  :integer          not null
#
class MaterialRelation < ApplicationRecord
  belongs_to :material
  belongs_to :partner
end
