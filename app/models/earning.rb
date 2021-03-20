# frozen_string_literal: true

class Earning < ApplicationRecord
  attr_accessor :external_ref

  belongs_to :employer
  belongs_to :employee

  before_validation :find_employee_id

  def load_earnings(file)
    service = EmployerCsvService.new
    service.employer_id = employer_id
    service.csv_fields = EmployerCsvLayout.where(employer_id: employer_id)
    service.process_csv(file)
  rescue StandardError => e
    e.message
  end

  private

  def find_employee_id
    self.employee_id = Employee.find_by(external_ref: external_ref).id
  rescue StandardError => e
    e.message
  end
end
