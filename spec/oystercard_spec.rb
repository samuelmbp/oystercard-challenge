require 'oystercard'

describe Oystercard do

  let(:oystercard) { Oystercard.new }
  let(:entry_station) {double(:entry_station)}
  let(:exit_station) {double(:exit_station)}

  it 'returns an instance of the class' do
    expect(oystercard).to be_an_instance_of(Oystercard)
  end

  describe '#top_up' do
    it 'has a balance of 0 by default' do
      expect(oystercard.balance).to eq 0
    end
    it 'tops up the balance' do
      oystercard.top_up(20)
      expect(oystercard.balance).to eq 20
    end
    it 'does not allow the balance to exceed the limit' do
      message = "Balance exceeds the limit of £#{Oystercard::LIMIT}"
      expect { oystercard.top_up(100) }.to raise_error(message)
    end
  end
  
  describe '#touch_in' do
    it 'touches in' do
      oystercard.top_up(Oystercard::MINIMUM_FARE)
      oystercard.touch_in(entry_station)
      expect(oystercard).to be_in_journey
    end
    it "touch_in remembers the entry station" do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      expect(oystercard.entry_station).to eq entry_station
    end
    it 'does not let to touch_in if there is insufficient balance' do 
      message = "The balance is insufficient. Minimum amount of £#{Oystercard::MINIMUM_FARE} required."
      expect { oystercard.touch_in(entry_station) }.to raise_error(message)
    end
  end
 

  describe '#touch_out' do
    it 'touches out' do
      oystercard.touch_out(exit_station)
      expect(oystercard).to_not be_in_journey
    end
    it "method takes an argument" do
      expect(oystercard).to respond_to(:touch_out).with(1).argument
    end
    it 'deducts the correct amount when touching out' do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      expect {oystercard.touch_out(exit_station)}.to change{oystercard.balance}.by(-Oystercard::MINIMUM_FARE)
    end
    it "forgets the exit station" do
      oystercard.top_up(20)
      oystercard.touch_in(entry_station)
      oystercard.touch_out(exit_station)
      expect(oystercard.exit_station).to be nil
    end
  end

  it 'responds to an empty journeys array' do
    expect(oystercard.journeys).to eq []
  end

  it "adds the stations to the journey array" do
    oystercard.top_up(20)
    oystercard.touch_in(entry_station)
    oystercard.touch_out(exit_station)
    expect(oystercard.journeys).to include(entry_station => exit_station)
  end
end