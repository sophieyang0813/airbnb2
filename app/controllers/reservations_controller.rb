class ReservationsController < ApplicationController 

	def new
		@listing = Listing.find(params[:listing_id])
		@reservation = Reservation.new
		render template: "reservations/new"
	end 

	def create 
		@reservation = Reservation.new(reservation_param)
		@reservation.user_id = current_user.id 
		@reservation.listing_id = params[:listing_id]
		if @reservation.save 
		 flash[:notice] = "reservation successful!"
		 redirect_to root_url
		end 
	end 

	private 

	def reservation_param
		param.require(:reservation).permit(:check_in, :check_out)
	end 

end 