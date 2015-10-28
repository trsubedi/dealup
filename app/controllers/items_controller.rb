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
      	@items = Item.where(:title => params[:search], :item_location => params[:location])

      elsif params[:search] != ""
      	@items= Item.search(params[:search])

	  elsif params[:location] != ""
      	
		  @items = Item.where(:item_location => params[:location])
		else
			redirect_to :back
	    end

    end

end



# location = "san francisco, ca"
# => "san francisco, ca"
# [2] pry(main)> array = location.split(", ")
# => ["san francisco", "ca"]
# [3] pry(main)> arrary[0]
# NameError: undefined local variable or method `arrary' for main:Object
# from (pry):3:in `__pry__'
# [4] pry(main)> array[0]
# => "san francisco"
# [5] pry(main)> array[0].split(" ").map(&:capitalize).join(" ")
# => "San Francisco"
# [6] pry(main)> array[1].upcase
# => "CA"
# [7] pry(main)> array.join(", ")
# => "san francisco, ca"
