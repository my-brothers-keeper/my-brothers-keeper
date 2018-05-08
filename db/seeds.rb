sarnelli = Organization.create(
  name: 'Blessed Sarnelli Community',
  description: 'Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.',
  address: '2739 Kensington Ave, Philadelphia, PA 19134'
)

sarnelli_needs_list =  [
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
]

sarnelli_needs_list.each do | item |
  Need.create(organization_id: sarnelli.id, item: item)
end
