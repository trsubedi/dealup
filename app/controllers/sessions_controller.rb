class SessionsController < ApplicationController
	def new
    @user = User.new
	end

  def create
  	user_params = params.require(:user).permit( :email, :password)
  	@user = User.confirm(user_params)
		if @user
  			login(@user)
  			redirect_to views_path
		else
  			redirect_to root_path
		end
	end

	def destroy
		@current_user = session[:user_id] = nil
		redirect_to root_path
	end
end
