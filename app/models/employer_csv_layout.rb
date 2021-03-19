# frozen_string_literal: true

class EmployerCsvLayout < ApplicationRecord
  belongs_to :employer

  def find_value(row)
    raw_value = row[field_position]
    format_value(raw_value)
  end

  private

  def format_value(raw_value)
    raw_value =
      case field_earnig_type
      when 'check_date'
        parse_date(raw_value, field_format)
      when 'amount'
        raw_value.gsub(field_format, '').to_f
      else
        raw_value
      end
  end

  def parse_date(value, format)
    format.blank? ? Date.strptime(value) : Date.strptime(value, format)
  end
end
