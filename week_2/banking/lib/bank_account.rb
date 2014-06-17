class BankAccount

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
