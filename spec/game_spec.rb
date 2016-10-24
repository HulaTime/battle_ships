require 'game'

describe Game do

	subject(:game) { described_class.new(player_1, player_2) }
	let(:game_board) { double :game_board, p1: {a1:nil,a2:nil,a3:nil,a4:nil,
																							b1:nil,b2:nil,b3:nil,b4:nil,
																							c1:nil,c2:nil,c3:nil,c4:nil},
																				 p2: {a1:nil,a2:nil,a3:nil,a4:nil,
																							b1:nil,b2:nil,b3:nil,b4:nil,
																							c1:nil,c2:nil,c3:nil,c4:nil} }
	let(:player_1) { 'Max' }
	let(:player_2) { double :player_2, name: '' }

	context 'Methods' do
		it { is_expected.to respond_to(:start) }
		it { is_expected.to respond_to(:p1_destroyer).with(2).arguments }
		it { is_expected.to respond_to(:p1_submarine).with(2).arguments }
		it { is_expected.to respond_to(:p1_cruiser).with(2).arguments }
		it { is_expected.to respond_to(:p1_battleship).with(2).arguments }
	end

	it 'A new game can be created with 1 player' do
		expect(Game).to respond_to(:new).with(1).argument
	end

	it 'A new game can be created with 2 players' do
		expect(Game).to respond_to(:new).with(2).arguments
	end 

	it 'An initialized game generates a message once started' do
		expect { game.start(game_board) }.to output('Welcome Max, you move first...').to_stdout
	end

	it 'Starting a new game generates a new board' do
		game.start(game_board)
		expect(game.p1_board).to eq game_board.p1
		expect(game.p2_board).to eq game_board.p2
	end

	xit 'No other functionality is available till a game has been started' do

	end

	context 'Game started' do
		before do
			game.start
		end

	end

end