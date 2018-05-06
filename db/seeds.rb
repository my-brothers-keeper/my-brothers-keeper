Organization.create(
  name: 'Blessed Sarnelli Community',
  description: 'Blessed Sarnelli Community is an organization dedicated to providing for the needs of people who are poor and abandoned with an emphasis on empowering young adults to share in this commitment through prayer, hospitality and service.',
  address: '2739 Kensington Ave, Philadelphia, PA 19134'
)

sarnelli_needs_list = [
[ 1, 'white socks' ],
[ 1, 'mens underwear' ],
[ 1, 't-shirts' ],
[ 1, 'bars of soap' ],
[ 1, 'pants' ],
[ 1, 'long underwear' ],
[ 1, 'shoes' ],
[ 1, 'sweaters' ],
[ 1, 'jackets' ],
[ 1, 'shaving cream' ],
[ 1, 'razors' ],
[ 1, 'shampoo' ],
[ 1, 'conditioner' ],
[ 1, 'body wash' ],
[ 1, 'toothbrushes' ],
[ 1, 'toothpaste' ],
[ 1, 'lotion' ],
[ 1, 'hair brushes' ],
[ 1, 'nail clippers' ],
[ 1, 'tomato sauce' ],
[ 1, 'tomato paste' ],
[ 1, 'crushed tomatoes' ],
[ 1, 'ketchup' ],
[ 1, 'black beans' ],
[ 1, 'kidney beans' ],
[ 1, 'pink beans' ],
[ 1, 'rice' ],
[ 1, 'rice' ],
[ 1, 'pasta' ],
[ 1, 'coffee' ],
[ 1, 'cake mixes' ],
[ 1, 'canned fruits' ],
[ 1, 'canned vegetables' ],
[ 1, 'tuna' ],
[ 1, 'peanut butter' ],
[ 1, 'jelly' ]
]

sarnelli_needs_list.each do | organization_id, item |
  Need.create(organization_id: organization_id, item: item)

end
