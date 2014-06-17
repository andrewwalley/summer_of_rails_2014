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
