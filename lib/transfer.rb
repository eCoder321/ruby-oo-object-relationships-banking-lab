
class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status, :amount
  def initialize(sender, receiver, status = 'pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if sender.balance >= amount && self.status == 'pending' && valid?
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      self.status = 'rejected'
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    # binding.pry
    if status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      # binding.pry
      self.status = 'reversed'
    end
  end

  
end
