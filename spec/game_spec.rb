require 'game'

describe Game do

	subject(:game) { described_class.new(player_1) }
	
	let(:player_1) { 'Max' }

	let(:game_board) { double :game_board, positions:
		{a1:nil,b1:nil,c1:nil,d1:nil,
		a2:nil,b2:nil,c2:nil,d2:nil,
		a3:nil,b3:nil,c3:nil,d3:nil,
		a4:nil,b4:nil,c4:nil,d4:nil}
	}

	it 'A new game can be created with 1 player' do
		expect(Game).to respond_to(:new).with(1).argument
		expect(game.player_2).to eq false
	end

	it 'A new game can be created with 2 players' do
		expect(Game).to respond_to(:new).with(2).arguments
	end

	it 'Game should keep track of player turn' do
		
		expect(game.player_turn).to eq 1
		game.attack('a1')
		expect(player_turn).to eq 2
	end

end