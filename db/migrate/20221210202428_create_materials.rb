# frozen_string_literal: true

class CreateMaterials < ActiveRecord::Migration[7.0]
  def change
    create_table :materials do |t|
      t.string :type, null: false

      t.timestamps
    end
  end
end
