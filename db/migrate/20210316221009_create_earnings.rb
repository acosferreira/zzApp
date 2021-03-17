class CreateEarnings < ActiveRecord::Migration[5.2]
  def change
    create_table :earnings do |t|
      t.references :employer, foreign_key: true
      t.references :employee, foreign_key: true
      t.date :earning_date
      t.decimal :amount

      t.timestamps
    end
  end
end
