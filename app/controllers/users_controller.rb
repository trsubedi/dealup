class UsersController < ApplicationController

	def create
		user_params = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
	    @user = User.create(user_params)
	    login(@user)
	    redirect_to views_path
	end

	def show
    @user = User.find(params[:id])
	end
	def update
		# binding.pry
        user_id = params[:id]
        @user = User.find(user_id)

        # get updated data
        updated_attributes = params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
        # update the creature
        @user.update(updated_attributes)

        #redirect to show
        redirect_to "/users/#{user_id}"
    end

end
