class AddItemLocationToItems < ActiveRecord::Migration
  def change
    add_column :items, :item_location, :string
  end
end
