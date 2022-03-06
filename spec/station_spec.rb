require 'station'

describe Station do
  let(:station) { Station.new('Oxford St.', 1) }

  it 'prints the station name' do
    expect(station.name).to eq('Oxford St.')
  end

  it 'prints the zone' do
    expect(station.zone).to eq(1)
  end
end
