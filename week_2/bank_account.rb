class BankAccount

  def to_s
    sprintf("$%.2f", self.balance)
  end

  def balance
    @balance = 0 if @balance.nil?
    @balance
  end
  
  def deposit(amount)
    @balance += amount
  end

end

account = BankAccount.new

account.deposit 20
puts account.to_s
