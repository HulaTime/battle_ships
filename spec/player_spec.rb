require 'player'

describe Player do

	subject(:player_1) { described_class.new('Max') }

	it 'New Players should be intialized with a name' do
		expect(player_1.name).to eq 'Max'
	end

	it 'Player should log moves made in attack' do
		player_1.attack('b6', 'b')
		player_1.attack('c1', 'd')
		expect(player_1.attack_log).to eq({b6:'b', c1:'d'})
	end

	it 'Player should log its defensive positions' do
		player_1.defense('a1', 'a4', 'b')
		player_1.defense('b2', 'b4', 'd')
		expect(player_1.defense_log).to eq({
			b: ['a1', 'a4'],
			d: ['b2', 'b4']
			})
	end
end