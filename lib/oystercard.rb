class Oystercard
  attr_reader :balance, :entry_station, :journeys, :exit_station
  LIMIT = 90
  MINIMUM_FARE = 1

  def initialize(balance = 0)
    @balance = balance
    @journeys = []
  end

  def top_up(amount)
    limit_error(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    insufficient_balance_error
    @entry_station = entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    add_journey(exit_station)
    @exit_station = nil
  end

  def in_journey?
    !!@entry_station
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

  def add_journey(exit_station)
    @journeys << { @entry_station => exit_station }
  end
end