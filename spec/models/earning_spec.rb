require 'rails_helper'
require 'csv'
RSpec.describe Earning, type: :model do
	it "should read acmeco and store the earning" do
		employeer = Employer.create(name: 'AcmeCo' )
		employer_csv = EmployeerCsv.create(employer: employeer, 
					   columns: '["EmployeeId", "CheckDate", "Amount"]', 
					   amount_position: 2, 
					   date_earning_position:1, 
					   external_id_position:0)
		employee = Employee.create(name: 'Ana', external_ref: 'ABC123', employer: employeer)

		ear = Earning.create(
			employer: employeer,
			employee: employee)
		e.save_earnings("../fixtures/AcmeCo.csv")
		expect(e.Amount.should ).to eq( 800)
		

	end

	it "should read BetaCo and store the earning" do
		employeer = Employer.create(name: 'AcmeCo' )
		employer_csv = EmployeerCsv.create(employer: employeer, 
					   columns: '["employee", "earningDate", "netAmount"]', 
					   amount_position: 2, 
					   date_earning_position:1, 
					   external_id_position:0)
		employee = Employee.create(name: 'Ana', external_ref: 'ABC123', employer: employeer)

		ear = Earning.create(
			employer: employeer,
			employee: employee)
		e.save_earnings("../fixtures/betaCo.csv")

		expect(e.Amount.should ).to eq( 800)
	end
end
