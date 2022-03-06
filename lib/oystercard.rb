require_relative 'journey'

class Oystercard

  attr_reader :balance, :journeys

  LIMIT = 90
  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journeys = []
    @journey = Journey.new
  end

  def top_up(amount)
    limit_error(amount)
    @balance += amount
  end

  def touch_in(entry_station)
    touch_out(nil) if in_journey?
    insufficient_balance_error
    @journey.start_journey(entry_station)
  end

  def touch_out(exit_station)
    @journey.finish_journey(exit_station)
    deduct(@journey.fare)
    @journeys << @journey.add_journey
  end
 
  def in_journey?
    @journey.entry_station != nil
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

