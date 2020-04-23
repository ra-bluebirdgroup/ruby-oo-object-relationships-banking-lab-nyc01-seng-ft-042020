class Transfer
  # your code here

  attr_accessor :sender, :receiver, :status
  attr_reader :amount
  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.balance > @amount && @sender.valid? && @status == 'pending' && @receiver.status == 'open'
      @sender.balance -= @amount
      @receiver.deposit(@amount)
      @status = 'complete'
    else
       @status = 'rejected'
      p "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
      if @status == 'complete'
        @receiver.balance -= @amount
        @sender.balance += @amount
        @status = 'reversed'
      end

  end


end
