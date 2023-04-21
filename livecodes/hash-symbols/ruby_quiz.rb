age = 21

if age >= 21
  puts 'you can vote'
end


# Complete the following code to compute the exact average of students grades (using each ).
grades = [19, 8, 11, 15, 13]
# TODO: compute and store the result in a variable `average`

sum = 0
grades.each do |number|
  # sum = sum + number
  sum += number
end
average = sum.to_f / grades.length
# average = sum.fdiv(grades.size)


# Define a capitalize_name method which takes first_name and last_name as parameters and returns the well-formatted fullname (with capitalized first and last names).

def capitalize_name(first_name, last_name)
  "#{first_name.capitalize} #{last_name.capitalize}"
end


fruits = ["banana", "peach", "watermelon", "orange"]
# INDEX   0         1         2             3

# Print out "peach" from the fruits array in the terminal
puts fruits[1]
# Add an "apple" to the fruits array
fruits << 'apple'
# Replace "watermelon" by "pear"
fruits[2] = 'pear'
# Delete "orange"
fruits.delete_at(3)
fruits.delete('orange')

p fruits


city = { name: "Paris", population: 2000000 }

# Print out the name of the city
puts city[:name]

# Add the Eiffel Tower to city with the `:monument` key
city[:monument] = 'Eiffel Tower'

# Update the population to 2000001
city[:population] = 2_000_001
# What will the following code return?
city[:mayor]
#=> nil


students = [ [ "john", 28 ], [ "mary", 25 ], [ "paul", 21 ] ]

# 1. go over the students array
# students.map do |student|
#   {
#     name: student[0],
#     age: student[1]
#   }
# end

students = students.map do |name, age|
  {
    name: name,
    age: age
  }
end
 p students
