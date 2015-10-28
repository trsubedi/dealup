require 'ffaker'
location = ["San Francisco, CA", "Richmond, CA", "Vallejo, CA", "San Mateo, CA",
			"San Jose, CA", "Palo Alto, CA", "Mountain View, CA", "Berkeley, CA",
			"Oakland, CA", "El Cerrito, CA", "Pinole, CA", "Bulingame, CA"]

30.times do ||

  User.create(first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name, email: FFaker::Internet::email, password: "password", location: location[rand(location.length)])
end

condition = ["Excellent", "good", "bad", "fucntional", "slightly damaged"]
images =["http://www.elizabethtaberlibrary.org/wp-content/uploads/2014/05/ipad.jpg",
		"http://o.aolcdn.com/hss/storage/adam/a00f4c02b8ad4295c5e09dccb8d3dc86/tcl-curved-4k-display-2013-01-07-01.jpg",
		"http://www.ducati.com/cms-web/upl/MediaGalleries/24/1/MediaGallery_1024570/Color_SBK-Panigale-R_1067x600.jpg",
		"http://detcad-nadejda.com/wp-content/uploads/2015/09/nova-kawasaki-ninja-650r.jpg",
		"http://store.storeimages.cdn-apple.com/4735/as-images.apple.com/is/image/AppleInc/aos/published/images/r/ef/refurb/macbookpro/refurb-macbookpro-15in-mtnlion?wid=1840&hei=1062&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1400701699589",
		"http://store.storeimages.cdn-apple.com/4760/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone6/plus/iphone6-plus-box-silver-2014_GEO_US?wid=478&hei=595&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1441799001004",
		"http://img0.gtsstatic.com/wallpapers/68189738c7f5e5ba81535c4499cdf414_large.jpeg",
]



list = ["Electronics", "Antiques", "Appliances", "Arts & Crafts", "Audio Equipment", "Auto parts", "Tickets", "Video Games", "Sports & Outdoors",
"Baby & kids", "Beauty & Health", "Bicycles", "Books & Magazines", "Furniture", "Motorcycles", "Musical Instruments", "Photography", "TV's",
"Motorcycles", "Jewelry", "services", "Cell Phones", "Clothing", "Collectibles", "Boats & Marine", "Cars & Trucks"]
list.each do |category|
	Category.create(name: category)
end

60.times do ||
  item = Item.create(title: FFaker::Product.product, price: rand(1..1000), description: FFaker::Lorem.sentence, category_id: rand(1..26), condition: condition[rand(condition.length)], image: images[rand(images.length)], item_location: location[rand(location.length)])
  # item.category = Category.find(item.category_id)
  Category.find(item.category_id).items << item

end