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

	def self.to_csv
	    CSV.generate do |csv|
	        csv << column_names
	        all.each do |dj|
	        	csv << dj.attributes.values_at(*column_names)
	      	end
	    end
	end



	def self.make
		@dj = Dj.all
		#intials = ["KAJ", "AMW", "JMB", "AWW", "DCG", "JPM", "MDH", "MDP", "BBZ", "CPU", "GWP", "JSS", "IJL", "KAM", "LLL", "DPM", "TLC", "JRS", "AMN", "GMV", "MJV", "NHD", "NGP", "DML", "ELL", "NRD", "MNB", "KIL", "MGN", "APP", "HHH", "SMB", "GPS", "ABB", "MSH", "HTJ", "HCS", "APE", "DUH", "JMR", "DMF", "CJV", "KJS", "ADS", "MCS", "RSZ", "JFK", "WDM", "SEH", "TRV", "A$S", "MJE", "CES", "MCS", "AVP", "HLM", "JBW"]
		intials = ["KAJ", "AMW", "JMB", "AWW", "DCG", "JPM", "MDH", "MDP", "BBZ", "CPU", "GWP", "JSS", "IJL", "KAM", "LLL", "DPM", "TLC", "JRS", "AMN", "GMV", "MJV", "NHD", "NGP", "DML", "ELL", "NRD", "MNB", "KIL", "MGN", "APP", "HHH", "SMB", "GPS", "ABB", "MSH", "HTJ", "HCS", "APE", "DUH", "JMR", "DMF", "CJV", "KJS", "ADS", "MCS", "RSZ", "JFK", "WDM", "SEH", "TRV", "A$S", "MJE", "CES", "MCS", "AVP", "HLM", "JBW"]
	    week = ["monday", "tuesday", "wednesday", "thursday", "friday", "saturday", "sunday"]
	    @dj.each do |dj|
	    	if dj.monday != nil
              	dj.monday = intials.delete_at(rand(intials.size))
          	end

          	if dj.tuesday != nil
              	dj.tuesday = intials.delete_at(rand(intials.size))
          	end

          	if dj.wednesday != nil
              	dj.wednesday = intials.delete_at(rand(intials.size))
          	end

          	if dj.thursday != nil
              	dj.thursday = intials.delete_at(rand(intials.size))
          	end

          	if dj.friday != nil
              	dj.friday = intials.delete_at(rand(intials.size))
          	end

          	if dj.saturday != nil
              	dj.saturday = intials.delete_at(rand(intials.size))
          	end

        	dj.save!

	      	#week.each do |day|
	        #	if dj.day != nil
	        #  		index = rand(intials.size)
	        #  		dj.monday = intials(index)
	        #  		dj.save
	        #	end
	      	#end
	    end
	end


end
