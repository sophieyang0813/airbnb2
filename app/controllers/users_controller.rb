class UsersController < Clearance::UsersController

	def new
	byebug
	@user = User.new
    end

	def create 
	  @user = User.new(user_params)
		if @user.save 
		sign_in @user
		redirect_back_or url_after_create
		else 
		render template: "users/new"
		end 
	end 


	def index
		@users = User.all
		@user = current_user
		if @user.roles == "superadmin" 
			flash[:notice] = "only superadmin can view this page"
		else 
			flash[:notice] = "sorry, you do not have an access to this page."
		end 
		render template: "users/index"
	end 

	private
	def user_params
		params.require(:user).permit(:name, :email, :password)
	end 
end
