GUIDES_DATA = [
['validates', 'Checks if a database item has valid information'],
['thing', 'Does a thing'],
['all', 'Comes up with a whole bunch of stuff'],
['where', 'Finds a bunch of stuff that you might have been looking for']
]

CONTRIBUTORS_DATA = [
   ["steve",  "steve@example.com",  'ilovewearinghighheels' ],
   ["grace",  "grace@example.com",  'ishimmyalot' ],
   ["adam",  "adam@example.com",  'steveistheworst' ]
]



GUIDES_DATA.each do |guides|
  Guide.create!(name: guides[0], description: guides[1])
end

CONTRIBUTORS_DATA.each do |contributor|
  Contributor.create!(name: contributor[0], email: contributor[1], password: contributor[2])
end
