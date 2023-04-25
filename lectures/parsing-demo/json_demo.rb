require "json"

# TODO - let's read/write data from beatles.json
filepath = "data/beatles.json"

# READ
serialized_beatles = File.read(filepath)
# p serialized_beatles
beatles = JSON.parse(serialized_beatles)
# p beatles["beatles"][1]['last_name']

# WRITE
beatles = {
  "title": "The Beatles",
  "beatles": [
    {
      "first_name": "John",
      "last_name": "Lennon",
      "instrument": "Guitar"
    },
    {
      "first_name": "Paul",
      "last_name": "McCartney",
      "instrument": "Bass Guitar"
    },
    {
      "first_name": "George",
      "last_name": "Harrison",
      "instrument": "Lead Guitar"
    },
    {
      "first_name": "Ringo",
      "last_name": "Starr",
      "instrument": "Drums"
    }
  ]
}

File.open(filepath,  "wb") do |file|
  serialized_beatles = JSON.generate(beatles)
  file.write(serialized_beatles)
end
