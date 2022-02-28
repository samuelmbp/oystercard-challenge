require 'oystercard'

describe Oystercard do

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

  # it 'deducts an amount from the balance' do
  #   subject.top_up(50)
  #   expect(subject.deduct(10)).to eq 40
  # end

  it 'touches in' do
    subject.top_up(Oystercard::MINIMUM_FARE)
    subject.touch_in
    expect(subject).to be_in_journey
  end

  it 'touches out' do
    subject.touch_out
    expect(subject).to_not be_in_journey
  end

  it 'does not let to touch_in if there is insufficient balance' do 
    message = "The balance is insufficient. Minimum amount of £#{Oystercard::MINIMUM_FARE} required."
    expect { subject.touch_in }.to raise_error(message)
  end

  it 'deducts the correct amount when touching out' do
    subject.top_up(20)
    subject.touch_in
    expect { subject.touch_out }.to change{ subject.balance }.by(-Oystercard::MINIMUM_FARE)
  end
end

