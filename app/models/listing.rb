class Listing < ApplicationRecord
	has_one :user
	# scope :amenities, -> (amenities) {where("amenities LIKE ?", amenities)}
	scope :location, -> (location) {where("location LIKE ?", location)}
end
