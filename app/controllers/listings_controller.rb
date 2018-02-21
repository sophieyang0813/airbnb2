class ListingsController < ApplicationController


	def new 
		@listing = Listing.new
		render template: "listings/new"
	end 

	def create
		@listing = Listing.new(listings_param)
		# @listing.user_id = current_user.id
		@listing.save
		redirect_to listing_path(@listing)
	end 

	  def index
		@listings = Listing.all
		@listing = Listing.paginate(:page => params[:page], :per_page => 10)
	  end 

	  def search
	  	@listings = Listing.all
	  	filtering_params(params).each do |key, value|
		@listings = @listings.public_send(key, value) if value.present? 
			# @listings = Listing.find_by(location: params[:location])
		# byebug	
		end 
	  	
	  end
	

	def show
		@listing = Listing.find(params[:id])
	end 

	private 
	def listings_param
		params.require(:listing).permit(:price, :location, :num_of_guests, :amenities => [])
	end 

	def filtering_params(params)
		params.slice(:amenities, :location)
		# params[:location]
	end 

end
