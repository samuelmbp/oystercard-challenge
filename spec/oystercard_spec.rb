require 'oystercard'

describe Oystercard do
let(:entry_station) {double(:entry_station)}
let(:exit_station) {double(:exit_station)}

  it 'returns an instance of the class with a perameter' do
    oystercard = Oystercard.new(10)
    expect(oystercard).to be_an_instance_of(Oystercard)
  end

  it 'has a balance of 0 by default' do
    expect(subject.balance).to eq 0
  end

  it 'tops up the balance' do
    subject.top_up(20)
    expect(subject.balance).to eq 20
  end

  it 'does not allow the balance to exceed the limit' do
    message = "Balance exceeds the limit of £#{Oystercard::LIMIT}"
    expect { subject.top_up(100) }.to raise_error(message)
  end

  it 'touches in' do
    subject.top_up(Oystercard::MINIMUM_FARE)
    subject.touch_in(entry_station)
    expect(subject).to be_in_journey
  end

  it 'touches out' do
    subject.touch_out(exit_station)
    expect(subject).to_not be_in_journey
  end

  it 'does not let to touch_in if there is insufficient balance' do 
    message = "The balance is insufficient. Minimum amount of £#{Oystercard::MINIMUM_FARE} required."
    expect { subject.touch_in(entry_station) }.to raise_error(message)
  end

  it 'deducts the correct amount when touching out' do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect { subject.touch_out(exit_station) }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end

  it "touch_in remembers the entry station" do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect(subject.entry_station).to eq entry_station
  end
  
  # it "touch_out forgets the entry station" do
  #   subject.top_up(20)
  #   subject.touch_in(entry_station)
  #   subject.touch_out(exit_station)
  #   expect(subject.entry_station).to be nil
  # end

  it "touch_out takes exit_station argument" do
    subject.top_up(20)
    subject.touch_in(entry_station)
    expect(subject.touch_out(exit_station)).to_not be nil
  end

  it 'responds to an empty journeys array' do
    expect(subject.journeys).to eq []
  end

  it "adds the stations to the journey array" do
    subject.top_up(20)
    subject.touch_in(entry_station)
    subject.touch_out(exit_station)
    expect(subject.journeys).to include(entry_station => exit_station)
  end
end

