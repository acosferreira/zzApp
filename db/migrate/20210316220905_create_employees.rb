# frozen_string_literal: true

class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :external_ref
      t.references :employer, foreign_key: true

      t.timestamps
    end
  end
end
