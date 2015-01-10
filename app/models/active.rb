require 'csv'

class Active < ActiveRecord::Base
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		    Active.create! row.to_hash
		    #document = find_by_id(row["id"]) || new
		    #document.attributes = row.to_hash.slice(*accessible_attributes)
		    #document.save!
		end
	end

	def self.to_csv(options = {})
	    CSV.generate(options) do |csv|
	        csv << column_names
	        all.each do |active|
	        	csv << active.attributes.values_at(*column_names)
	      	end
	    end
	end


	def self.makeinitials()
		@actives = Active.all
		@actives.find_each do |active|
			if active.first == "Macaulay"
				active.initials = "MAC"
			elsif active.middle.chr != "\""
				active.initials = active.first.chr+active.middle.chr+active.last.chr
			else
				active.initials = active.first.chr+active.middle[1]+active.last.chr
			end
			active.save!
		end
	end

	def self.countinhouse
		count = 0
		@actives = Active.all
		@actives.find_each do |active|
			if active.inhouse?
				count = count+1
			end
		end
		return count
	end

	def self.countouthouse
		count = 0
		@actives = Active.all
		@actives.find_each do |active|
			if active.inhouse == false
				count = count+1
			end
		end
		return count
	end
end
