require "csv"

# TODO - let's read/write data from beatles.csv
# filepath = "data/beatles.csv"

# CSV.foreach("data/beatles.csv", 'r', headers: :first_row) do |row|
#   #=> ["Ringo", "Starr", "Drums"]
#   #<CSV::Row "First Name":"John" "Last Name":"Lennon" "Instrument":"Guitar">
#   # p row
#   # p "#{row[0]} #{row[1]} plays #{row[2]}"
#   p "#{row['First Name']} #{row['Last Name']} plays #{row['Instrument']}"
# end



# STORING
beatles = [
  ["John","Lennon","Guitar"],
  ["Paul","McCartney","Bass Guitar"],
  ["George","Harrison","Lead Guitar"],
  ["Ringo","Starr","Drums"]
]

CSV.open("data/beatles.csv", 'wb') do |csv|
  # WE CAN ONLY STORE AN ARRAY OF STRING
  csv << ["First Name","Last Name","Instrument"]
  beatles.each do |beatle|
    csv << beatle
  end
end
