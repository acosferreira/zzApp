require 'CSV'
class Employer < ApplicationRecord

	has_one :employer_csv
	validates :name,  presence: true

	def self.get_csv_layout
		data = CSV.read("spec/fixtures/AcmeCo.csv")
		Employer.employer_csv.create(Employer: employer, columns: data[0])
	end


end
