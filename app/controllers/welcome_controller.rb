class WelcomeController < ApplicationController
	def splash
		@user =User.new
	end
	
	def views
		@category = Category.all
		@item = Item.all
	end
end
