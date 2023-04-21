students = ['Luna',      'Hermione',   'Draco']
houses    = ['Ravenclaw', 'Gryffindor', 'Slytherin']
# INDEX        0         1             2

students.each_with_index do |name, index|
  puts "#{name} is #{houses[index]}"
end


#=> Luna is Ravenclaw
#=> Draco is Slytherin

# HASH

hogwarts = {
  'Luna' => 'Ravenclaw',
  'Hermione' => 'Gryffindor',
  'Draco' => 'Slytherin',
  'Ron' => 'Gryffindor'
}

p hogwarts
