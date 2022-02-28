class Oystercard
  attr_reader :balance
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @in_use = false
  end

  def top_up(amount)
    limit_error(amount)
    @balance += amount
  end

  def touch_in
    insufficient_balance_error
    @in_use = true
  end

  def touch_out
    deduct(MINIMUM_FARE)
    @in_use = false
  end

  def in_journey?
    @in_use == true
  end

  private

  def deduct(amount)
    @balance -= amount
  end

  def limit_error(amount)
    raise "Balance exceeds the limit of £#{LIMIT}" if @balance + amount >= LIMIT
  end

  def insufficient_balance_error
    raise "The balance is insufficient. Minimum amount of £#{MINIMUM_FARE} required." if @balance < MINIMUM_FARE
  end
end
