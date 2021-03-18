class ChangeCsvEmployer < ActiveRecord::Migration[5.2]
  def change
  	remove_column :employeer_csvs, :amount_position 
  	remove_column :employeer_csvs, :date_earning_position 
  	remove_column :employeer_csvs, :external_id_position

  	add_column :employeer_csvs, :field_name, :string
	add_column :employeer_csvs, :field_earnig_type, :string
	add_column :employeer_csvs, :field_position, :integer
	add_column :employeer_csvs, :field_format, :string


  end
end
