module SavingsAccount

  def self.interest_rate(balance)
    case balance
    when (...0) then -3.213
    when (0...1000) then 0.5
    when (1000...5000) then 1.621
    when (5000..) then 2.475
    end
  end

  def self.annual_balance_update(balance)
    interest = 1.0 + (interest_rate(balance).abs / 100)
    balance * interest
  end

  def self.years_before_desired_balance(current_balance, desired_balance)
    counter = 0
    while current_balance < desired_balance
      current_balance = annual_balance_update(current_balance)
      counter += 1
    end
    counter
  end
end
