class CreateEmployerCsvLayouts < ActiveRecord::Migration[5.2]
  def change
    create_table :employer_csv_layouts do |t|
      t.references :employer, foreign_key: true
      t.string :columns
      t.string :amount_position
      t.string :date_earning_position
      t.string :external_id_position
      t.timestamps
    end
  end
end
