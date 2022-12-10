# frozen_string_literal: true

class CreateMaterialRelations < ActiveRecord::Migration[7.0]
  def change
    create_table :material_relations do |t|
      t.integer :partner_id, null: false
      t.integer :material_id, null: false

      t.timestamps
    end
  end
end
