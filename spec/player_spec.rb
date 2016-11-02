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

	it 'Player should log its defensive positions' do
		player_1.defense('a1', 'a4', 'b')
		player_1.defense('b2', 'd2', 'd')
		expect(player_1.ship_positions).to eq({
			b: ['a1', 'a2', 'a3', 'a4'],
			d: ['b2', 'c2', 'd2']
			})
	end
end