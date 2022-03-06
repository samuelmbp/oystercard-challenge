class Journey
  attr_reader :entry_station, :exit_station, :complete

  PENALTY_FARE = 6
  MINIMUM_FARE = 1

  def initialize
    @complete = false
    @entry_station = nil
  end

  def start_journey(entry_station)
    @entry_station = entry_station
  end

  def finish_journey(exit_station)
    @exit_station = exit_station
    @complete = true
  end

  def failed_to_touch_in
    if entry_station == nil
      balance
    end
  end

   def add_journey
    { @entry_station => @exit_station }
   end

  def fare 
    !@entry_station || !@exit_station ? PENALTY_FARE : MINIMUM_FARE
  end
end
