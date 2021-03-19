# frozen_string_literal: true

require 'csv'
class Employer < ApplicationRecord
  has_one :employer_csv_layout
  has_many :emplyees
  has_many :earnings
  validates :name, presence: true

  def create_earnings(file)
    earnings.new.load_earnings(file)
  end
end
