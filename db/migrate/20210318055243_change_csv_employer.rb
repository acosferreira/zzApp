class ChangeCsvEmployer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employer_csv_layouts, :amount_position 
  	remove_column :employer_csv_layouts, :date_earning_position 
  	remove_column :employer_csv_layouts, :external_id_position

  	add_column :employer_csv_layouts, :field_name, :string
	add_column :employer_csv_layouts, :field_earnig_type, :string
	add_column :employer_csv_layouts, :field_position, :integer
	add_column :employer_csv_layouts, :field_format, :string


  end
end
