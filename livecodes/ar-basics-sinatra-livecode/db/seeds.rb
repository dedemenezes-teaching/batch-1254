require 'faker'

puts 'Creating restaurants...'

10.times do
  restaurant = Restaurant.new(
    name: Faker::Games::Pokemon.name,
    address: Faker::Games::Pokemon.location,
    rating: rand(1..5)
  )
  restaurant.save
end

puts 'Finished zo/'
