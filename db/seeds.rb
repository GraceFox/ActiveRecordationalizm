GUIDES_DATA = [
[':validates', 'Checks if a database item has valid information'],
[':thing', 'Does a thing'],
['#all', 'Comes up with a whole bunch of stuff'],
['#where', 'Finds a bunch of stuff that you might have been looking for']
]

GUIDES_DATA.each do |guides|
  Guide.create!(name: guides[0], description: guides[1])
end
