class EmployeerCsv < ApplicationRecord
  belongs_to :employer

  def find_value(row)
    raw_value = row[self.field_position]
    # format_value(raw_value)
  end

private
  def format_value(raw_value)
    # normalize self.format
  end
  
end
