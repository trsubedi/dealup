class ItemsController < ApplicationController

	def index
		@category =Category.all
		@items= Category.find(params[:id]).items
		# binding.pry
	end

	def new
		@user = User.find(session[:user_id])
		@item = Item.new
		render :new
	end

	def create
		# TODO: add :image

		item_params = params.require(:item).permit(:title, :user_id, :price, :description, :condition, :image, :item_location, :category_id)
	    @item = Item.create(item_params)
	    Category.find(item_params[:category_id]).items << @item
	    redirect_to views_path
	end

	def update
		updateditems = params.require(:item).permit(:title, :price, :description, :condition)
	end

	def show
		item_id = params[:id]
		@item = Item.find(item_id)

		@users = User.all
		@hash = Gmaps4rails.build_markers(@item) do |item, marker|
  			marker.lat item.latitude
  			marker.lng item.longitude
  		end
	end

	def search
		@category = Category.all

      if params[:search] != "" && params[:location] != "" 
      	@items = Item.where(:title => params[:search].strip, :item_location => params[:location].strip)

      elsif params[:search] != "" 
      	@items= Item.where(:title =>params[:search].strip)

	  elsif params[:location] != ""
      	
		  @items = Item.where(:item_location => params[:location].strip)
		else
			redirect_to :back
	    end

    end

end



