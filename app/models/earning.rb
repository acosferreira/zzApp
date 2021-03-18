require 'csv'
class Earning < ApplicationRecord
  attr_accessor :external_ref

  belongs_to :employer
  belongs_to :employee

  before_validation :find_employee_id

  private

  def find_employee_id
    self.employee_id = Employee.find_by(external_ref: external_ref).id
  end
end
