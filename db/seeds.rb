# Wipe everything clean first
Need.destroy_all
Category.destroy_all
Organization.destroy_all

uncategorized = Category.create!(name: "uncategorized")
clothing = Category.create!(name: "Clothing")
toiletries = Category.create!(name: "Toiletries")
food_pantry_items = Category.create!(name: "Food Pantry Items")
food = Category.create!(name: "Food")
supplies = Category.create!(name: "Supplies")
adults_clothing = Category.create!(name: "Adults' Clothing")
childrens_clothing = Category.create!(name: "Childrens' Clothing")

sarnelli = Organization.create!(
  name: "Blessed Sarnelli Community",
  description: "Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.",
  address: "2739 Kensington Ave, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.123686, 39.990711)
)


sarnelli_needs_list =  [
  ["White socks", clothing],
  ["Mens underwear", clothing],
  ["T-shirts", clothing],
  ["Bars of soap", toiletries],
  ["Pants", clothing],
  ["Long underwear", clothing],
  ["Shoes", clothing],
  ["Sweaters", clothing],
  ["Jackets", clothing],
  ["Shaving cream", toiletries],
  ["Razors", toiletries],
  ["Shampoo", toiletries],
  ["Conditioner", toiletries],
  ["Body wash", toiletries],
  ["Toothbrushes", toiletries],
  ["Toothpaste", toiletries],
  ["Lotion", toiletries],
  ["Hair brushes", toiletries],
  ["Nail clippers", toiletries],
  ["Tomato sauce", food_pantry_items],
  ["Tomato paste", food_pantry_items],
  ["Crushed tomatoes", food_pantry_items],
  ["Ketchup", food_pantry_items],
  ["Black beans", food_pantry_items],
  ["Kidney beans", food_pantry_items],
  ["Pink beans", food_pantry_items],
  ["Rice", food_pantry_items],
  ["Pasta", food_pantry_items],
  ["Coffee", food_pantry_items],
  ["Cake mixes", food_pantry_items],
  ["Canned fruits", food_pantry_items],
  ["Canned vegetables", food_pantry_items],
  ["Tuna", food_pantry_items],
  ["Peanut butter", food_pantry_items],
  ["Jelly", food_pantry_items],
]

sarnelli_needs_list.each do | item, category |
  Need.create!(
    organization_id: sarnelli.id,
    item: item,
    category: category
  )
end

last_stop = Organization.create(
  name: "Last Stop",
  description: "Last Stop is a no-frills sober living environment where homeless alcoholics and addicts can recover by learning to live a life of service from the example of others like them who are doing the same.  We serve the community every day by handing out clothing and meals to those who are still suffering in the heart of Kensington's drug trade",
  address: "1816 East Somerset St, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.122393, 39.991042)
)

ls_needs_list = [
  ["Shoes", clothing],
  ["Socks", clothing],
  ["T-shirts", clothing],
  ["Underwear (men’s + women’s)", clothing],
  ["Bras", clothing],
  ["Jeans", clothing],
  ["Tanktops", clothing],
  ["Shorts", clothing],
  ["Hot dogs", food],
  ["Baked beans", food],
  ["Spaghetti", food],
  ["Tomato Sauce", food],
  ["Napkins", supplies],
  ["Paper towels", supplies],
  ["Large styrofoam cups", supplies],
  ["Iced tea mix", food],
  ["Coffee", food],
  ["Styrofoam/paper plates", supplies],
]

ls_needs_list.each do | item, category |
  Need.create!(
    organization_id: last_stop.id, 
    item: item,
    category: category
    )
end

rock = Organization.create(
  name: "Rock Ministries",
  description: "A Bible, boxing gloves and five boys … that’s how Rock Ministries started. With its goal to reach at-risk, inner city youth with the Gospel of Jesus Christ, the Rock has now grown to serve over 5000 kids through sports, arts, music, recreation, mentoring and Bible studies.  Through our church, Calvary Chapel of Kensington, we also serve the community with outreaches, support for addicts and others in need, a food pantry, and most importantly the consistent teaching of the Word of God.",
  address: "2755 Kensington Ave, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.123262, 39.990834)
)

rock_needs_list = [
  ["Shoes", adults_clothing],
  ["Socks",adults_clothing],
  ["T-shirts", adults_clothing],
  ["Underwear (men’s + women’s)", adults_clothing],
  ["Bras", adults_clothing],
  ["Jeans", adults_clothing],
  ["Tanktops", adults_clothing],
  ["Shorts", adults_clothing],
  ["shoes", childrens_clothing],
  ["socks", childrens_clothing],
  ["t-shirts", childrens_clothing],
  ["underwear", childrens_clothing],
  ["pants", childrens_clothing],
  ["shorts", childrens_clothing],
  ["Non-perishable foods", food_pantry_items]
]

rock_needs_list.each do | item, category |
  Need.create(
    organization_id: rock.id, 
    item: item,
    category: category
    )
end
