class ListingsController < ApplicationController


	def new 
		@listing = Listing.new
		render template: "listings/new"
	end 

	def create
		@listing = Listing.new(listings_param)
		# @listing.user_id = current_user.id
		@listing.save
		redirect_to root_url
	end 

	def index
		@listings = Listing.all
		@listing = Listing.paginate(:page => params[:page], :per_page => 10)
	end 

	private 
	def listings_param
		params.require(:listing).permit(:price, :location, :num_of_guests)
	end 

end
