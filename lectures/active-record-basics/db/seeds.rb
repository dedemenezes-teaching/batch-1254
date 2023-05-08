# This is where you can create initial data for your app.
require 'faker'

# restaurant = Restaurant.new(name: 'Pizza Hut', address: 'London', rating: 4, cuisine: 'italian')
# restaurant.save!
# # raises an error with the bang!

# chez_gladines = Restaurant.new(name: "Chez Gladines", address: 'Paris', cuisine: 'french')
# chez_gladines.save

5.times do
  restaurant = Restaurant.new(
    name: Faker::Fantasy::Tolkien.character,
    cuisine: Faker::Restaurant.type,
    address: Faker::Movies::StarWars.planet,
    rating: rand(1..5)
  )
  restaurant.save
end

Restaurant.create(
  name: Faker::Fantasy::Tolkien.character,
  cuisine: Faker::Restaurant.type,
  address: Faker::Movies::StarWars.planet,
  rating: rand(1..5)
)
