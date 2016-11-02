require 'game'
require 'byebug'

describe Game do

	subject(:game) { described_class.new(player_1) }
	
	let(:player_1) { double :player_1, name: 'Max'}

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

	it 'Player cannot attack twice in a row' do
		allow(Kernel).to receive(:rand) { 1 }
		game.attack('a1')
		expect(game.attack_log[:p1]).to eq ["a1"]
		game.attack('a2')
		expect(game.attack_log[:p1]).to eq ["a1"]
		expect(game.attack_log[:p2]).to eq ["a2"]
	end

	it 'Player can set their defensive positions' do
		game.set_defense('a1', 'a5', 'b')
		expect(game.defense[:p1][:b]).to eq ['a1', 'a2', 'a3', 'a4', 'a5']
	end
end