class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :user_id
      t.string :title
      t.float :price
      t.string :description
      t.string :condition

      t.timestamps null: false
    end
  end
end
