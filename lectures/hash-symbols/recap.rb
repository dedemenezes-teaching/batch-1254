# RECAP
# String
p 'My house is Ravenclaw'.class
house = 'Ravenclaw'
p "My house is #{house}"

# Integer
12
1000
50_000
# Float
12.5

# Range
(1..10)
(1...10)

# TrueClass | FalseClass
false
true

# ARRAY

array = []
array_example = ['John', 23]

# CRUD
# Create

# Add new element
array << 'Harry'
array.push('Hermione')
# p array
# Read FROM ARRAY by index
p array[1]

# Update
array[0] = 'Ron'
p array

array << 'Ron'
p array

# # Delete
array.delete_at(0) # PREFERE DELETE BY INDEX
array.delete('Ron')
p array
