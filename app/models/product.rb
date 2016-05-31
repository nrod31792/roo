class Product < ActiveRecord::Base

	def self.import(file)
	  spreadsheet = open_spreadsheet(file)
  	  header = spreadsheet.row(1)
  	  (2..spreadsheet.last_row).each do |i|
  	  	row = Hash[[header, spreadsheet.row(i)].transpose]
  	  	product = find_by_id(row["id"]) || new
  	  	product.attributes = row.to_hash.slice(*accessible_attributes)
    	product.save!
      end
  end


    def self.open_spreadsheet(file)
  		case File.extname(file.original_filename)
  		when ".csv" then Roo::Csv.new(file.path, nil, :ignore)
  		when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  		when ".xlsx" then Roo::Excelx.new(file.path, :ignore if nil)
  		else raise "Unknown file type: #{file.original_filename}"
  		end
  end
end
