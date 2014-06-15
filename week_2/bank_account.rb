module Interest
  def calculateInterest(amount)
    puts "#{sprintf("$%.2f", ((amount * 0.15) * 1))}"
  end
end

class BankAccount
  include Interest

  attr_reader :balance
  attr_accessor :deposit_log, :name

  def to_s
    sprintf("$%.2f", self.balance)
  end

  def initialize
    @balance = 0
    @deposit_log = ""
    @deposits = [] 
  end
 
  def deposit(amount)
    @balance += amount
    @deposit_log = "Deposit of #{sprintf("$%.2f", amount)}"
    @deposits.push "#{self.deposit_log}"
  end

  def history
    puts "History for account \"#{self.name}\""
    @deposits.each do |log|
      log
    end

  end

  def withdraw(withdraw_amount)
    @balance -= (withdraw_amount) 
    @deposit_log = "Withdrawal of #{sprintf("$%.2f", withdraw_amount)}"
    @deposits.push("#{self.deposit_log}")
  end

  def summary
    "The account \"" + self.name + "\" has a balance of " + 
          self.balance.to_s
  end

end

account = BankAccount.new
account.name = "TestAccount"

account.deposit 20
account.deposit 20
account.withdraw 30
account.deposit 100

puts account.history
puts account.summary
account.calculateInterest(account.balance) 
