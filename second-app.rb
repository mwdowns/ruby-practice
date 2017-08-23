puts "hello. what's your full name?"

name = gets.chomp.split
first_name = name[0]
last_name = name[1]

puts "your first name is: ", first_name
puts "your last name is: ", last_name

puts "what is your address?"

address = gets.chomp.split
address_number = address[0]
last_number_index = address_number.length
last_number = address_number[last_number_index - 1]
first_three_numbers = address_number.chomp(last_number_index.to_s)
puts "this is your street number: ", address[0]
puts "this is the first three numbers: ", first_three_numbers
puts "this is the last number: ", last_number
