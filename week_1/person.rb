person = Hash.new
people = []
add_names = true

while(add_names) do

  puts "What is the first name"
  first = gets.chop

  puts "What is the last lame"
  last = gets.chop

  puts "What is the users age"
  age = gets.chop

  person = {
    first_name: first,
    last_name: last,
    age: age
  }

  people.push(person)

  puts "Would you like to add more people? y or n"
  answer = gets.chop
  if answer == "n"
    add_names = false
  end

end

#puts people.length
#people.each { |k, v| puts "#{k}/n#{v}" }
people.each do |person|
  puts "#{person[:first_name]}"
  puts "#{person[:age]}\n"
end

