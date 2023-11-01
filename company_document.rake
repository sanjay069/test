require 'csv'
task :company_document => :environment do 
	CSV.foreach("db/document.csv",headers: false) do |row|
		loan_case = LoanCase.find_by(company_id: 38, case_no: row[3])
		if loan_case
			loan_case.update_columns(created_at: DateTime.strptime(row[2], '%d.%m.%Y'))
		else
			puts "loan Case not found for case_no #{row[3]}"
		end	
	end
end
