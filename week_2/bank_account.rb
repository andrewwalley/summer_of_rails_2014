class BankAccount

  def to_s
    sprintf("$%.2f", self.balance)
  end

  def balance
    @balance ||= 0
  end


end


account = BankAccount.new

puts account
