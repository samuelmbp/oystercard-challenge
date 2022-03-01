require 'station'

describe Station do
  let(:station) { Station.new('Station Name', 'Station Zone') }

    it 'takes a name of the station as an argument' do
      expect(station.name).to eq('Station Name')
    end

    it 'takes zone of the station as an argument' do
      expect(station.zone).to eq('Station Zone')
    end
end
