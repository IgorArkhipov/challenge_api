# frozen_string_literal: true

class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :email, null: false
      t.index :email, unique: true
      t.string :password_digest, null: false

      t.timestamps
    end
  end
end
