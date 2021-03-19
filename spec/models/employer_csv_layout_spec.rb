require 'rails_helper'

RSpec.describe EmployerCsvLayout, type: :model do
	context '#find_value AcmeCo' do
		subject {employer_csv_layout.find_value(row)}
		let(:employer) {create(:employer, :AcmeCo)}
  	let(:row){['ABC123','12/14/2020','$800']}
	  	
  	context 'when type is external_ref' do
  		let(:employer_csv_layout) { create(:employer_csv_layout, :external_ref_acme, employer: employer)}
	  	it 'return external_ref' do
				expect(subject).to eq 'ABC123'				
			end
		end
		
		context 'when type is check_date' do
			let(:employer_csv_layout) { create(:employer_csv_layout, :check_date_acme, employer: employer)}
			it 'return check_date' do
				expect(subject).to eq '2020-12-14'.to_date				
			end
		end

		context 'when type is amount' do
			let(:employer_csv_layout) { create(:employer_csv_layout, :earning_acme, employer: employer)}
			it 'return amount' do
				expect(subject).to eq 800.0			
			end
		end
		
	end

	context '#find_value BetaCo' do
		subject {employer_csv_layout.find_value(row)}
		let(:employer) {create(:employer, :AcmeCo)}
  		let(:row){['ABC123','2020-12-14','800.00']}
	  	
  	context 'when type is external_ref' do
  		let(:employer_csv_layout) { create(:employer_csv_layout, :external_ref_beta, employer: employer)}
	  	it 'return external_ref' do
				expect(subject).to eq 'ABC123'				
			end
		end
		
		context 'when type is check_date' do
			let(:employer_csv_layout) { create(:employer_csv_layout, :check_date_beta, employer: employer)}
			it 'return check_date' do
				expect(subject).to eq '2020-12-14'.to_date				
			end
		end

		context 'when type is amount' do
			let(:employer_csv_layout) { create(:employer_csv_layout, :earning_beta, employer: employer)}
			it 'return amount' do
				expect(subject).to eq 800.0
			end
		end
		
	end
end
