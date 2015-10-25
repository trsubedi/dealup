class ItemsController < ApplicationController

	def new
		
	end

	def create
		item_params = params.require(:item).permit(:title, :price, :description, :condition, :image)
	    @item = Item.create(item_params)
	end
end
