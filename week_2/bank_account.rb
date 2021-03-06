class WithdrawalMoreThanBalanceError < StandardError
  def to_s
    "The withdrawal amount cannot exceed the balance"
  end
end

class WrongDataTypeForWithdrawError < StandardError
  def to_s
    "The withdraw amount must be a number"
  end
end

class WrongDataTypeForDepositError < StandardError
  def to_s
    "The deposit amount must be a number"
  end
end

module Interest
  def calculate_interest(amount)
    sprintf("$%.2f", ((amount * 0.15) * 1))
  end
end

module Logger
  private
  def log(message)
    output = "#{Time.now} : #{message}"
    File.open("log.txt", "w") do |logfile|
        logfile << output
    end
  end
end

#this is some text on my new branch

class BankAccount
  include Interest
  include Logger

  attr_reader :balance
  attr_accessor :deposit_log, :name 

  def to_s
    sprintf("$%.2f", self.balance)
  end

  def initialize(starting_balance = 0, starting_name = 0)
    @balance = starting_balance
    @name = starting_name
    @deposit_log = ""
    @deposits = [] 
  end
 
  def deposit(amount)
    raise WrongDataTypeForDepositError unless amount.is_a? Numeric
    @balance += amount
    @deposit_log = "Deposit of #{sprintf("$%.2f", amount)}"
    @deposits.push "#{self.deposit_log}"  
  end

  def history
    log_output = "" 
    puts "History for account \"#{self.name}\""
    @deposits.each do |log| 
      log_output += "#{log}\n"
    end
  end

  def withdraw(withdraw_amount)
      raise WithdrawalMoreThanBalanceError unless withdraw_amount < self.balance    
      raise WrongDataTypeForWithdrawError unless withdraw_amount.is_a? Numeric
      @balance -= (withdraw_amount) 
      @deposit_log = "Withdrawal of #{sprintf("$%.2f", withdraw_amount)}"
      @deposits.push("#{self.deposit_log}")
  end

  def summary
    "The account \"" + self.name + "\" has a balance of " + 
          self.balance.to_s
  end

end

account = BankAccount.new(0, "Homer's Savings")
puts account.balance
puts account.name
#account.log("Message number 2")


#account.deposit 20
#account.deposit 20
#account.withdraw 30
#account.deposit 100

#puts account.history
#puts account.summary
#puts account.calculate_interest(account.balance) 
