require 'csv'
require 'open-uri'

class Dj < ActiveRecord::Base
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		    Dj.create! row.to_hash
		    #document = find_by_id(row["id"]) || new
		    #document.attributes = row.to_hash.slice(*accessible_attributes)
		    #document.save!
		end
	end

	def self.to_csv(options = {})
		CSV.generate(options) do |csv|
	        csv << column_names
	        all.each do |dj|
	        	csv << dj.attributes.values_at(*column_names)
	      	end
	    end
	    #headers = ['Name', 'Location']
		#CSV.generate_line headers
        #all.each do |dj|
        #	CSV.generate_line([dj.name, dj.location])
      	#end
	end

	def self.to_xls(options = {})
		#old roo code
		# loads an Excel Spreadsheet for Excel .xlsx files
		#s = Roo::Excelx.new("Djs.xlsx")
		# first sheet in the spreadsheet file will be used
		#s.default_sheet = s.sheets.first

		book = Spreadsheet::Workbook.new

		sheet1 = book.create_worksheet
		sheet1.name = 'DJs for the Week'

		#makes names
		sheet1.row(2).concat %w{Name Location Jokes}


		#numRows = @djs.size


		#interates starting at third row
		#sheet1.each 1 do |row|
		#count = 0
		#all.each do |dj|
		#	row = count
		#	sheet1.row(row+3).push ['butts' ]
		#	count = count + 1
		#end
		

		#write excell file
		#spreadsheet = StringIO.new 
		#book.write spreadsheet 
		#send_data spreadsheet.string, :filename => "DJs.xls", :type =>  "application/vnd.ms-excel"
		book.write 'public/djs.xls'
	end

	def self.countMonday()
		@djs = Dj.all
		count = 0
		@djs.each do |dj|
			if dj.monday != nil
				if dj.monday.length > 0
					count = count+1
				end
			end
		end
		return count
	end

	def self.count()
		@djs = Dj.all
		count = 0
		@djs.each do |dj|
			if dj.monday != nil
				if dj.monday.length > 0
					count = count+1
				end
			end
			if dj.tuesday != nil
          		if dj.tuesday.length > 0
              		count = count+1
              	end
          	end

          	if dj.wednesday != nil
          		if dj.wednesday.length > 0
              		count = count+1
              	end
          	end

          	if dj.thursday != nil
          		if dj.thursday.length > 0
              		count = count+1
              	end
          	end

          	if dj.friday != nil
          		if dj.friday.length > 0
              		count = count+1
              	end
          	end

          	if dj.saturday != nil
          		if dj.saturday.length > 0
              		count = count+1
              	end
          	end

          	if dj.sunday != nil
          		if dj.sunday.length > 0
              		count = count+1
              	end
          	end
		end
		return count
	end


	def self.make()
		@dj = Dj.all
		#initials = ["KAJ", "AMW", "JMB", "AWW", "DCG", "JPM", "MDH", "MDP", "BBZ", "CPU", "GWP", "JSS", "IJL", "KAM", "LLL", "DPM", "TLC", "JRS", "AMN", "GMV", "MJV", "NHD", "NGP", "DML", "ELL", "NRD", "MNB", "KIL", "MGN", "APP", "HHH", "SMB", "GPS", "ABB", "MSH", "HTJ", "HCS", "APE", "DUH", "JMR", "DMF", "CJV", "KJS", "ADS", "MCS", "RSZ", "JFK", "WDM", "SEH", "TRV", "A$S", "MJE", "CES", "MCS", "AVP", "HLM", "JBW"]
		#initials = ["KAJ", "AMW", "JMB", "AWW", "DCG", "JPM", "MDH", "MDP", "BBZ", "CPU", "GWP", "JSS", "IJL", "KAM", "LLL", "DPM", "TLC", "JRS", "AMN", "GMV", "MJV", "NHD", "NGP", "DML", "ELL", "NRD", "MNB", "KIL", "MGN", "APP", "HHH", "SMB", "GPS", "ABB", "MSH", "HTJ", "HCS", "APE", "DUH", "JMR", "DMF", "CJV", "KJS", "ADS", "MCS", "RSZ", "JFK", "WDM", "SEH", "TRV", "A$S", "MJE", "CES", "MCS", "AVP", "HLM", "JBW"]
	    @actives = Active.all
	    inhouse = Array.new(Active.countinhouse)
	    inindex = 0
	    outhouse = Array.new(Active.countouthouse)
	    outindex = 0
	    @actives.each do |active|
	    	if active.inhouse?
	    		inhouse[inindex]=active.initials
	    		inindex = inindex+1
	    	else
	    		outhouse[outindex]=active.initials
	    		outindex = outindex+1
	    	end
	    end
	    week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
	    @dj.each do |dj|
	    	if dj.monday != nil
	    		if dj.monday.length > 0
              		dj.monday = outhouse.delete_at(rand(outhouse.size))
              	end
          	end

          	if dj.tuesday != nil
          		if dj.tuesday.length > 0
              		dj.tuesday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

          	if dj.wednesday != nil
          		if dj.wednesday.length > 0
              		dj.wednesday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

          	if dj.thursday != nil
          		if dj.thursday.length > 0
              		dj.thursday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

          	if dj.friday != nil
          		if dj.friday.length > 0
              		dj.friday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

          	if dj.saturday != nil
          		if dj.saturday.length > 0
              		dj.saturday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

          	if dj.sunday != nil
          		if dj.sunday.length > 0
              		dj.sunday = inhouse.delete_at(rand(inhouse.size))
              	end
          	end

        	dj.save!
	    end
	end


end
