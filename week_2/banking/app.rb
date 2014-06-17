require_relative 'lib/logger'
require_relative 'lib/interest'
require_relative 'lib/exceptions'
require_relative 'lib/bank_account'

account = BankAccount.new(0, "Andy's Account")

keep_going = true
while keep_going do

  puts %Q{Deposit or Withdrawal? ("d" or "w")}
  transaction = gets.chop

  puts "Amount?"
  amount = gets.chop

  amount = amount.to_f

  if transaction == "d"
    account.deposit amount
  else
    account.withdraw amount
  end

  puts "Your new balance is #{account}"

  puts %Q{More transactions? ("y" to continue "n" to quit)}

  if gets.chop == "y"
    keep_going #keep_going = gets.chop == "y" || gets.chop = "n"
  else
    keep_going = false
  end
end
puts "Thank you!"
