require 'rails_helper'

RSpec.describe Employer, type: :model do
  
  context '#load_earnings AcmeCo' do
	subject {employer.load_earnings(file)}
	let(:employer) {create(:employer, :AcmeCo)}
	let(:employee) {create(:employee, :ana, employer: employer)}
	let(:employeer_csv) { create_list(:employeer_csv, 3, :external_ref_acme, employer: employer )}
	let(:file){"spec/fixtures/AcmeCo.csv"}
	  	
  	context 'when type is external_ref' do
  		it 'employer have earnings' do
			 expect(employee.name).to eq 'test'
			 expect(employeer_csv).to_not eq ''
			 expect(subject.ids.size).to eq 1			
		end
  	end
  end  

  context '#load_earnings AcmeCo Full' do
	subject {employer.load_earnings(file)}
	let(:employer) {create(:employer, :AcmeCo)}
	let(:employee) {create(:employee, :ana, employer: employer)}
	let(:employeer_csv) { create_list(:employeer_csv, 3, :external_ref_acme, employer: employer )}
	let(:file){"spec/fixtures/AcmeCoFull.csv"}
	  	
  	context 'when type is external_ref' do
  		it 'employer have earnings' do
			 expect(employee.name).to eq 'test'
			 expect(employeer_csv).to_not eq ''
			 expect(subject.ids.size).to eq 100
			 # expect(subject.count).to eq 100	

		end
  	end
  end  
end
