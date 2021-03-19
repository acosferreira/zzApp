FactoryBot.define do
  factory :employer_csv_layout do
    trait :external_ref_acme do
      field_name 'EmployeeId'
      field_earnig_type 'external_ref'
      field_position 0
      field_format ''
    end
    trait :check_date_acme do
      field_name 'DateOfPayment'
      field_earnig_type 'check_date'
      field_position 1
      field_format '%m/%d/%Y'
    end
    trait :earning_acme do
      field_name 'Amount'
      field_earnig_type 'amount'
      field_position 2
      field_format '$'
    end

    trait :external_ref_beta do
      field_name 'employee'
      field_earnig_type 'external_ref'
      field_position 0
      field_format ''
    end
    trait :check_date_beta do
      field_name 'earningDate'
      field_earnig_type 'check_date'
      field_position 1
      field_format ''
    end
    trait :earning_beta do
      field_name 'netAmount'
      field_earnig_type 'amount'
      field_position 2
      field_format ''
    end
  end
end
