require 'oystercard'

describe Oystercard do

  it "returns an instance of the class with a perameter" do
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

  it 'deducts an amount from the balance' do
    subject.top_up(50)
    expect(subject.deduct(10)).to eq 40
  end
end

