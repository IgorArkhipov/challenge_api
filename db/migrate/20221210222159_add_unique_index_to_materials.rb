# frozen_string_literal: true

class AddUniqueIndexToMaterials < ActiveRecord::Migration[7.0]
  def change
    change_table :materials do |t|
      t.index :type, unique: true
    end
  end
end
