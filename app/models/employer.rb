require 'CSV'
class Employer < ApplicationRecord

	has_one :employer_csv
	has_many :emplyees
	validates :name,  presence: true

	def load_earnings(file)
		file = CSV.foreach(file, {headers: false})
	    service = EmployerCsvService.new
	    service.employer_id = self.id
	    service.csv_fields = EmployeerCsv.where(employer_id: self.id)
	    earnings = service.process_csv(file)
	end

	private

	def get_employee(external_ref)
		self.employees.find_by(external_ref: external_ref)
	end


end
