number1 = 0
number2 = 0
number3 = 0 
total = 0

puts "What is the first number?"
number1 = gets.chop

puts "What is the second number?"
number2 = gets.chop

puts "What is the last number?"
number3 = gets.chop

number1 = number1.to_i
number2 = number2.to_i
number3 = number3.to_i

total = number1 + number2 + number3

puts "The total of #{number1}, #{number2}, and #{number3} is #{total}."
      
