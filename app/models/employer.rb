require 'csv'
class Employer < ApplicationRecord

	has_one :employer_csv
	has_many :emplyees
	has_many :earnings
	validates :name,  presence: true

	def load_earnings(file)
		file = CSV.foreach(file, {headers: true})
		service = EmployerCsvService.new
	    service.employer_id = self.id
	    service.csv_fields = EmployeerCsv.where(employer_id: self.id)
	    earnings = service.process_csv(file)
	end

end
