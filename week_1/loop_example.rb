keepGoing = true

def is_odd_or_even?(number)
  if number % 2 == 0
    puts "It is an even number"
  else
    puts "It is an odd number"
  end
end

while(keepGoing) do

  puts "Enter some cool stuffs"
  userInput = gets.chop
  if userInput == ""
    keepGoing = false
  end

  if userInput.to_i.to_s == userInput
    puts is_odd_or_even?(userInput.to_i)
  else
    puts "Input is a string"
  end

end


