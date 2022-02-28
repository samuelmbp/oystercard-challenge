class Oystercard
  attr_reader :balance
  LIMIT = 90

  def initialize(balance = 0)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    limit_error(amount)
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
    @in_use = true
  end

  def touch_out
    @in_use = false
  end

  def in_journey?
    @in_use == true
  end

  private

  def limit_error(amount)
    raise "Balance exceeds the limit of £#{LIMIT}" if @balance + amount >= LIMIT
  end
end
