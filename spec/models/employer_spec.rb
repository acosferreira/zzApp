require 'rails_helper'

RSpec.describe Employer, type: :model do
  
  context '#load_earnings AcmeCo' do
	subject {employer.create_earnings(file)}
	let(:employer) {create(:employer, :AcmeCo)}
	let(:employee) {create(:employee, :ana, employer: employer)}
	let(:employer_csv_layout) { create_list(:employer_csv_layout, 3, :external_ref_acme, employer: employer )}
	  	
  	context 'when type is external_ref' do
  		let(:file){"spec/fixtures/AcmeCo.csv"}
	
  		it 'employer have earnings' do
			 expect(employee.name).to eq 'test'
			 expect(employer_csv_layout).to_not eq ''
			 expect(subject.ids.size).to eq 1			
		end
  	end

  	context 'when type is external_ref' do
  		let(:file){"spec/fixtures/AcmeCoFull.csv"}
	
  		it 'employer have earnings' do
			 expect(employee.name).to eq 'test'
			 expect(employer_csv_layout).to_not eq ''
			 expect(subject.ids.size).to eq 100
		end
  	end
  end  
end
