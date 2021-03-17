require 'csv'
class Earning < ApplicationRecord
  belongs_to :employer
  belongs_to :employee

 # before_validations :save_earnings

  def save_earnings(file)
  	
  	dates_earning = {}
  	data = CSV.read(file)
  	data.each_with_index  do |row, i|
  		next if i ==0
  		dates_earning= {external_ref: row[find_employee_id], earning_date: row[find_date_earning], earning_amount: row[find_amout]}
  	end
  	employee_info = get_employee(dates_earning[:external_ref])
  	self.earning_date = format_date(dates_earning[:earning_date])
  	self.eamount = dates_earning[:earning_amount]
  end

   
  
  def self.get_employee(external_ref)
  	Employee.find_by(external_ref: external_ref)
  end

  def self.find_amout
  	 Employee.employer.amount_position
  end

  def self.find_date_earning
  	Employee.employer.date_earning_position
  end

  def self.find_employee_id
  	Employee.employer.external_id_position
  end

  def format_date(date)
  	#TBD
  end


end
