# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Employer, type: :model do
  context '#load_earnings AcmeCo' do
    subject { employer.create_earnings(file) }
    let!(:employer) { create(:employer, :AcmeCo) }
    let!(:employee) { create(:employee, :ana, employer: employer) }
    let!(:employer_csv_layout) { create_list(:employer_csv_layout, 3, :external_ref_acme, employer: employer) }

    context 'simple file' do
      let(:file) { 'spec/fixtures/AcmeCo.csv' }

      it 'employer have earnings' do
        expect(subject.ids.size).to eq 1
      end
    end

    context 'long file' do
      let(:file) { 'spec/fixtures/AcmeCoFull.csv' }

      it 'employer have earnings' do
        expect(subject.ids.size).to eq 100
      end
    end

    context 'file contains error' do
      let(:file) { 'spec/fixtures/BetaCo.csv' }

      it 'employer have earnings' do
        expect(subject.ids.size).to eq 1
        expect(subject.failed_instances.size).to eq 2
      end
    end

    context 'File error' do
      let(:file) { 'spec/fixtures/123.csv' }
      it 'employer have earnings' do
        expect(subject).to eq 'No such file or directory @ rb_sysopen - spec/fixtures/123.csv'
      end
    end
  end
end
