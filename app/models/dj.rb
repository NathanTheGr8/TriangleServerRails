require 'csv'
require 'roo'

class Dj < ActiveRecord::Base
	def self.import(file)
	  CSV.foreach(file.path, headers: true) do |row|
	    Dj.create! row.to_hash
	    #document = find_by_id(row["id"]) || new
	    #document.attributes = row.to_hash.slice(*accessible_attributes)
	    #document.save!
	  end
	end
end
