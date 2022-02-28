class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
  end

  def top_up(amount)
    limit_error(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  private

  def limit_error(amount)
    raise "Balance exceeds the limit of £#{LIMIT}" if @balance + amount >= LIMIT
  end
end
