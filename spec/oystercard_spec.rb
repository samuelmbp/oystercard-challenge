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

end

