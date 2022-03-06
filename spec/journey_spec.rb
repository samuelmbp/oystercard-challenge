require 'journey'

describe Journey do
  
  let(:journey) { described_class.new }
  let(:station) { double :station, zone: 1 }

  it 'understands when a journey is not complete' do
    # expect(journey).to_not be_complete
    expect(journey.complete).to be false
  end

  context '#start_journey' do
    it 'returns the entry station' do
      expect(journey.start_journey(station)).to eq journey.entry_station
    end
  end

  describe '#finish_journey' do
    it 'assigns the exit station' do
      journey.finish_journey(station)
      expect(journey.exit_station).to eq station 
    end
  end
 
  it 'returns a penalty fare when not touching in' do
    journey.finish_journey(station)
    expect(journey.fare).to eq Journey::PENALTY_FARE
  end

  # it 'charges the minimum fare when the journey is complete' do
  #   journey.start_journey(station)
  #   journey.finish_journey(station)
  #   expect(journey).to eq Journey::MINIMUM_FARE
  # end


  it 'completes a journey when touching in and touching out' do
    journey.start_journey(station)
    journey.finish_journey(station)
    # expect(journey).to be_complete
    expect(journey.complete).to be true
  end
end