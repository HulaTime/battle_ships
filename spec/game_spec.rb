require 'game'

describe Game do

	subject(:game) { described_class.new(player_1, player_2) }
	let(:game_board) { double :game_board, p1: {a1:nil,a2:nil,a3:nil,a4:nil},
																				 p2: {a1:nil,a2:nil,a3:nil,a4:nil} }
	let(:player_1) { 'Max' }
	let(:player_2) { double :player_2, name: '' }

	context 'Methods' do
		it { is_expected.to respond_to(:start) }
		it { is_expected.to respond_to(:p1_move).with(3).arguments }
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
		expect(game.p1_defense).to eq game_board.p1
		expect(game.p2_board).to eq game_board.p2
	end

	context 'Game started' do
		before do
			game.start(game_board)
		end

		context 'Possible Moves horizontally' do
			it 'Player 1 can move a destroyer' do
				game.p1_move('d', 'a1', 'a2')
				expect(game.p1_defense).to eq({
					a1:'d',a2:'d',a3:nil,a4:nil
				})
			end

			it 'Player 1 can move a submarine' do
				game.p1_move('s', 'a1', 'a3')
				expect(game.p1_defense).to eq({
					a1:'s',a2:'s',a3:'s',a4:nil
				})
			end

			it 'Player 1 can move a cruiser' do
				game.p1_move('c', 'a1', 'a3')
				expect(game.p1_defense).to eq({
					a1:'c',a2:'c',a3:'c',a4:nil
				})
			end

			it 'Player 1 can move a battleship' do
				game.p1_move('b', 'a1', 'a4')
				expect(game.p1_defense).to eq({
					a1:'b',a2:'b',a3:'b',a4:'b'
				})
			end
		end

		context 'Possible Moves vertically' do

			xit 'same tests as horizontal but vertical' do
			end

		end
	end
end