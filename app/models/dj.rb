require 'csv'
#require 'roo'

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
              		dj.monday = outhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.tuesday != nil
          		if dj.tuesday.length > 0
              		dj.tuesday = inhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.wednesday != nil
          		if dj.wednesday.length > 0
              		dj.wednesday = inhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.thursday != nil
          		if dj.thursday.length > 0
              		dj.thursday = inhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.friday != nil
          		if dj.friday.length > 0
              		dj.friday = inhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.saturday != nil
          		if dj.saturday.length > 0
              		dj.saturday = inhouse.delete_at(rand(initials.size))
              	end
          	end

          	if dj.sunday != nil
          		if dj.sunday.length > 0
              		dj.sunday = inhouse.delete_at(rand(initials.size))
              	end
          	end

        	dj.save!

	      	#week.each do |day|
	        #	if dj.day != nil
	        #  		index = rand(initials.size)
	        #  		dj.monday = initials(index)
	        #  		dj.save
	        #	end
	      	#end
	    end
	end


end
