require 'ffaker'
20.times do ||
  User.create(first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email, password_digest: "password", location: FFaker::Address.city)
end

condition = ["Excellent", "good", "bad", "fucntional", "slightly damaged"]

20.times do ||
  Item.create(title: FFaker::Product.product, price: rand(1..1000), description: FFaker::Lorem.sentence, condition: condition[rand(condition.length)])
end