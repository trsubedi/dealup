class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :password_digest
      t.string :photo
      t.string :location
      t.float :lat
      t.float :lang

      t.timestamps null: false
    end
  end
end
