class EmployeerCsv < ApplicationRecord
  belongs_to :employer

  def find_value(row)
    raw_value = row[self.field_position]
    format_value(raw_value)
  end

private
  def format_value(raw_value)
    #trocar por um case
    case self.field_earnig_type
    when 'check_date' 
      raw_value = parse_date(raw_value, self.field_format )
    when 'amount'
      raw_value = raw_value.gsub(self.field_format,'').to_f
    else
      raw_value
    end
  end

  def parse_date(value, format)
    format.blank? ? Date.strptime(value) : Date.strptime(value, format)
  end
  
end
