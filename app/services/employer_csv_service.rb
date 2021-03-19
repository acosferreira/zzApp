class EmployerCsvService
    attr_accessor :employer_id, :csv_fields
   
    def process_csv(file)
      earnings = []
      
      file.each do |row|
         earning_values = parse_to_earning(row)
         earnings << Earning.new(earning_values)
      end
      Earning.import!(earnings)
    end

    private
   
    def parse_to_earning(row)
      earnings = {}
      earnings['employer_id']= self.employer_id
      csv_fields.each do |field|
        next if field.find_value(row).blank?
        earnings[field.field_earnig_type] = field.find_value(row)
      end
      earnings 
    end
  end