<<<<<<< HEAD
# Wipe everything clean first
Need.destroy_all
Category.destroy_all
Organization.destroy_all

category = Category.create!(name: 'uncategorized')

sarnelli = Organization.create!(
  name: 'Blessed Sarnelli Community',
  description: 'Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.',
  address: '2739 Kensington Ave, Philadelphia, PA 19134',
=======
sarnelli = Organization.create(
  name: "Blessed Sarnelli Community",
  description: "Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.",
  address: "2739 Kensington Ave, Philadelphia, PA 19134",
>>>>>>> Added the rest of the organizations and needs to the seed file
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.123686, 39.990711)
)

sarnelli_needs_list =  [
<<<<<<< HEAD
  'white socks',
  'mens underwear',
  't-shirts',
  'bars of soap',
  'pants',
  'long underwear',
  'shoes',
  'sweaters',
  'jackets',
  'shaving cream',
  'razors',
  'shampoo',
  'conditioner',
  'body wash',
  'toothbrushes',
  'toothpaste',
  'lotion',
  'hair brushes',
  'nail clippers',
  'tomato sauce',
  'tomato paste',
  'crushed tomatoes',
  'ketchup',
  'black beans',
  'kidney beans',
  'pink beans',
  'rice',
  'pasta',
  'coffee',
  'cake mixes',
  'canned fruits',
  'canned vegetables',
  'tuna',
  'peanut butter',
  'jelly'
=======
  "white socks", 
  "mens underwear", 
  "t-shirts", 
  "bars of soap", 
  "pants", 
  "long underwear", 
  "shoes", 
  "sweaters", 
  "jackets", 
  "shaving cream", 
  "razors", 
  "shampoo", 
  "conditioner", 
  "body wash", 
  "toothbrushes", 
  "toothpaste", 
  "lotion", 
  "hair brushes", 
  "nail clippers", 
  "tomato sauce", 
  "tomato paste", 
  "crushed tomatoes", 
  "ketchup", 
  "black beans", 
  "kidney beans", 
  "pink beans", 
  "rice", 
  "pasta", 
  "coffee", 
  "cake mixes", 
  "canned fruits", 
  "canned vegetables", 
  "tuna", 
  "peanut butter", 
  "jelly"
>>>>>>> Added the rest of the organizations and needs to the seed file
]

sarnelli_needs_list.each do | item |
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
  "Shoes",
  "Socks",
  "T-shirts",
  "Underwear (men’s + women’s)",
  "Bras",
  "Jeans",
  "Tanktops",
  "Shorts",
  "Hot dogs",
  "Baked beans",
  "Spaghetti",
  "Tomato Sauce",
  "Napkins",
  "Paper towels",
  "Large styrofoam cups",
  "Iced tea mix",
  "Coffee",
  "Styrofoam/paper plates"
]

ls_needs_list.each do | item |
  Need.create(organization_id: last_stop.id, item: item)
end

rock = Organization.create(
  name: "Rock Ministries",
  description: "A Bible, boxing gloves and five boys … that’s how Rock Ministries started. With its goal to reach at-risk, inner city youth with the Gospel of Jesus Christ, the Rock has now grown to serve over 5000 kids through sports, arts, music, recreation, mentoring and Bible studies.  Through our church, Calvary Chapel of Kensington, we also serve the community with outreaches, support for addicts and others in need, a food pantry, and most importantly the consistent teaching of the Word of God.",
  address: "2755 Kensington Ave, Philadelphia, PA 19134",
  location: RGeo::Cartesian.preferred_factory(srid: 4326).point(-75.123262, 39.990834)
)

rock_needs_list = [
  "Shoes",
  "Socks",
  "T-shirts",
  "Underwear (men’s + women’s)",
  "Bras",
  "Jeans",
  "Tanktops",
  "Shorts",
  "Childrens shoes",
  "Childrens socks",
  "Childrens t-shirts",
  "Childrens underwear",
  "Childrens pants",
  "Childrens shorts",
  "Non-perishable foods"
]

rock_needs_list.each do | item |
  Need.create(organization_id: rock.id, item: item)
end
