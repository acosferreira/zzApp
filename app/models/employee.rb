# frozen_string_literal: true

class Employee < ApplicationRecord
  belongs_to :employer
  has_many :earnings
  validates :name, presence: true
end
