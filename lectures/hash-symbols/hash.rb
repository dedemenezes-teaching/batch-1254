# HASH
# {
#   key => value
# }

rio = {
  'country' => 'Brasil',
  'population' => 6_748_000
}

# READ by the KEY
p rio['country']
p rio['population']

# ADD NEW KEY/VALUE PAIR
# monument is christ
rio['monument'] = 'Christ'

# UPDATE
rio['population'] = 6748001

# DELETE
rio.delete('monument')
p rio


# EACH on Hashes
# {"country"=>"Brasil", "population"=>6748001}
rio.each do |key, value|
  puts "#{key} is #{value}"
end


p rio.key?('name')
p rio.key?('country')

# Retrieve all keys as Array
p rio.keys
# Retrieve all values as Array
p rio.values

paris = {
  "country" => "France",
  "population" => 2211000
}


cities = {
  'rio' => { 'country' => 'Brazil', 'population' => 6_000_000 },
  'paris' => { 'country' => 'France', 'population' => 2_000_000 }
}

p cities['rio']['country']
