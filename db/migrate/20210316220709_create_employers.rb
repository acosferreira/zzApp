# frozen_string_literal: true

class CreateEmployers < ActiveRecord::Migration[5.2]
  def change
    create_table :employers do |t|
      t.string :name
      t.string :string

      t.timestamps
    end
  end
end
