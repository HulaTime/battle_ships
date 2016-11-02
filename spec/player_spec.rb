require 'player'

describe Player do

	subject(:player_1) { described_class.new('Max') }

	it 'New Players should be intialized with a name' do
		expect(player_1.name).to eq 'Max'
	end

	it 'Player should log moves made in attack' do
		player_1.attack('b6')
		player_1.attack('c1')
		expect(player_1.attack_log).to eq(['b6', 'c1'])
	end

end