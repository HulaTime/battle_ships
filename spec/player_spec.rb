require 'player'

describe Player do

	subject(:player_1) { described_class.new('Max') }

	it 'New Players should be intialized with a name' do
		expect(player_1.name).to eq 'Max'
	end

end