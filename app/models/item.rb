class Item < ActiveRecord::Base
	belongs_to :user
	belongs_to :category
	geocoded_by :item_location  # can also be an IP address
	after_validation :geocode 

	def self.search(search)
		where("title LIKE ?", "%#{search}%") 
	end

	# def self.searchLocation(location)
		
	#     where("item_location LIKE ?", "%#{location}%") 
	# end


	# def self.searchLocationAndItem(search, location)
	# 	where("title LIKE ?", "%#{search}%","item_location LIKE ?", "%#{location}%")
	  	
	# end

end
