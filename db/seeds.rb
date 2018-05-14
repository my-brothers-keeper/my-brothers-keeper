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
  ["white socks", "Clothing"],
  ["mens underwear", "Clothing"],
  ["t-shirts", "Clothing"],
  ["bars of soap", "Toiletries"],
  ["pants", "Clothing"],
  ["long underwear", "Clothing"],
  ["shoes", "Clothing"],
  ["sweaters", "Clothing"],
  ["jackets", "Clothing"],
  ["shaving cream", "Toiletries"],
  ["razors", "Toiletries"],
  ["shampoo", "Toiletries"],
  ["conditioner", "Toiletries"],
  ["body wash", "Toiletries"],
  ["toothbrushes", "Toiletries"],
  ["toothpaste", "Toiletries"],
  ["lotion", "Toiletries"],
  ["hair brushes", "Toiletries"],
  ["nail clippers", "Toiletries"],
  ["tomato sauce", "Food Pantry Items"],
  ["tomato paste", "Food Pantry Items"],
  ["crushed tomatoes", "Food Pantry Items"],
  ["ketchup", "Food Pantry Items"],
  ["black beans", "Food Pantry Items"],
  ["kidney beans", "Food Pantry Items"],
  ["pink beans", "Food Pantry Items"],
  ["rice", "Food Pantry Items"],
  ["pasta", "Food Pantry Items"],
  ["coffee", "Food Pantry Items"],
  ["cake mixes", "Food Pantry Items"],
  ["canned fruits", "Food Pantry Items"],
  ["canned vegetables", "Food Pantry Items"],
  ["tuna", "Food Pantry Items"],
  ["peanut butter", "Food Pantry Items"],
  ["jelly", "Food Pantry Items"],
]

sarnelli_needs_list.each do | item, category |
  Need.create!(
    organization_id: sarnelli.id,
    item: item,
    category: Category.where(name: category).first || uncategorized
  )
end

last_stop = Organization.create(
  name: "Last Stop",
  description: "Last Stop is a no-frills sober living environment where homeless alcoholics and addicts can recover by learning to live a life of service from the example of others like them who are doing the same.  We serve the community every day by handing out clothing and meals to those who are still suffering in the heart of Kensington's drug trade",
  address: "1816 East Somerset St, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.122393, 39.991042)
)

ls_needs_list = [
  ["Shoes", "Clothing"],
  ["Socks", "Clothing"],
  ["T-shirts", "Clothing"],
  ["Underwear (men’s + women’s)", "Clothing"],
  ["Bras", "Clothing"],
  ["Jeans", "Clothing"],
  ["Tanktops", "Clothing"],
  ["Shorts", "Clothing"],
  ["Hot dogs", "Food"],
  ["Baked beans", "Food"],
  ["Spaghetti", "Food"],
  ["Tomato Sauce", "Food"],
  ["Napkins", "Supplies"],
  ["Paper towels", "Supplies"],
  ["Large styrofoam cups", "Supplies"],
  ["Iced tea mix", "Food"],
  ["Coffee", "Food"],
  ["Styrofoam/paper plates", "Supplies"],
]

ls_needs_list.each do | item, category |
  Need.create!(
    organization_id: last_stop.id, 
    item: item,
    category: Category.where(name: category).first || uncategorized
    )
end

rock = Organization.create(
  name: "Rock Ministries",
  description: "A Bible, boxing gloves and five boys … that’s how Rock Ministries started. With its goal to reach at-risk, inner city youth with the Gospel of Jesus Christ, the Rock has now grown to serve over 5000 kids through sports, arts, music, recreation, mentoring and Bible studies.  Through our church, Calvary Chapel of Kensington, we also serve the community with outreaches, support for addicts and others in need, a food pantry, and most importantly the consistent teaching of the Word of God.",
  address: "2755 Kensington Ave, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.123262, 39.990834)
)

rock_needs_list = [
  ["Shoes", "Adults' Clothing"],
  ["Socks","Adults' Clothing"],
  ["T-shirts", "Adults' Clothing"],
  ["Underwear (men’s + women’s)", "Adults' Clothing"],
  ["Bras", "Adults' Clothing"],
  ["Jeans", "Adults' Clothing"],
  ["Tanktops", "Adults' Clothing"],
  ["Shorts", "Adults' Clothing"],
  ["shoes", "Childrens' Clothing"],
  ["socks", "Childrens' Clothing"],
  ["t-shirts", "Childrens' Clothing"],
  ["underwear", "Childrens' Clothing"],
  ["pants", "Childrens' Clothing"],
  ["shorts", "Childrens' Clothing"],
  ["Non-perishable foods", "Food Pantry Items"]
]

rock_needs_list.each do | item, category |
  Need.create(
    organization_id: rock.id, 
    item: item,
    category: Category.where(name: category).first || uncategorized
    )
end
