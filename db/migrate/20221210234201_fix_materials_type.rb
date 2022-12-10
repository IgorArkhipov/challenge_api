# frozen_string_literal: true

class FixMaterialsType < ActiveRecord::Migration[7.0]
  def change
    rename_column :materials, :type, :name
  end
end
