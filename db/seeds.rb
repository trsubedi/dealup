require 'ffaker'
20.times do ||
  User.create(first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email, password_digest: "password", location: FFaker::Address.city)
end

condition = ["Excellent", "good", "bad", "fucntional", "slightly damaged"]

20.times do ||
  Item.create(title: FFaker::Product.product, price: rand(1..1000), description: FFaker::Lorem.sentence, condition: condition[rand(condition.length)])
end

list = ["Electronics", "Antiques", "Appliances", "Arts & Crafts", "Audio Equipment", "Auto parts", "Tickets", "Video Games", "Sports & Outdoors",
"Baby & kids", "Beauty & Health", "Bicycles", "Books & Magazines", "Furniture", "Motorcycles", "Musical Instruments", "Photography", "TV's",
"Motorcycles", "Jewelry", "services", "Cell Phones", "Clothing", "Collectibles", "Boats & Marine"]
list.each do |category|
	Category.create(name: category)
end