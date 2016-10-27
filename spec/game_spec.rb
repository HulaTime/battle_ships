require 'game'

describe Game do

	subject(:game) { described_class.new(player_1) }
	
	let(:player_1) { 'Max' }

	let(:game_board) { double :game_board, board:
		{a1:nil,b1:nil,c1:nil,d1:nil,
		a2:nil,b2:nil,c2:nil,d2:nil,
		a3:nil,b3:nil,c3:nil,d3:nil,
		a4:nil,b4:nil,c4:nil,d4:nil}
	}

	it 'A new game can be created with 1 player' do
		expect(Game).to respond_to(:new).with(1).argument
	end

	it 'A new game can be created with 2 players' do
		expect(Game).to respond_to(:new).with(2).arguments
	end 

	it 'Starting a new game generates a new board' do
		game.start(game_board)
		expect(game.p1_defense.board).to eq game_board.board
		expect(game.p2_defense.board).to eq game_board.board
	end

	context 'Game started' do

		context 'Possible Moves horizontally' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.move('d', 'a1', 'a2')
				expect(game.p1_defense.board[:a1]).to eq 'd'
				expect(game.p1_defense.board[:a2]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.move('s', 'a1', 'a3')
				expect(game.p1_defense.board[:a1]).to eq 's'
				expect(game.p1_defense.board[:a2]).to eq 's'
				expect(game.p1_defense.board[:a3]).to eq 's'
			end

			it 'Player 1 can move a cruiser' do
				game.move('c', 'a1', 'a3')
				expect(game.p1_defense.board[:a1]).to eq 'c'
				expect(game.p1_defense.board[:a2]).to eq 'c'
				expect(game.p1_defense.board[:a3]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.move('b', 'a1', 'a4')
				expect(game.p1_defense.board[:a1]).to eq 'b'
				expect(game.p1_defense.board[:a2]).to eq 'b'
				expect(game.p1_defense.board[:a3]).to eq 'b'
				expect(game.p1_defense.board[:a4]).to eq 'b'
			end
		end

		context 'Possible Moves vertically' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.move('d', 'a1', 'b1')
				expect(game.p1_defense.board[:a1]).to eq 'd'
				expect(game.p1_defense.board[:b1]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.move('s', 'a1', 'c1')
				expect(game.p1_defense.board[:a1]).to eq 's'
				expect(game.p1_defense.board[:b1]).to eq 's'
				expect(game.p1_defense.board[:c1]).to eq 's'

			end

			it 'Player 1 can move a cruiser' do
				game.move('c', 'a1', 'c1')
				expect(game.p1_defense.board[:a1]).to eq 'c'
				expect(game.p1_defense.board[:b1]).to eq 'c'
				expect(game.p1_defense.board[:c1]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.move('b', 'a1', 'd1')
				expect(game.p1_defense.board[:a1]).to eq 'b'
				expect(game.p1_defense.board[:b1]).to eq 'b'
				expect(game.p1_defense.board[:c1]).to eq 'b'
				expect(game.p1_defense.board[:d1]).to eq 'b'
			end
		end

		context 'Possible Moves diagonally' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.move('d', 'a1', 'b2')
				expect(game.p1_defense.board[:a1]).to eq 'd'
				expect(game.p1_defense.board[:b2]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.move('s', 'b1', 'd3')
				expect(game.p1_defense.board[:b1]).to eq 's'
				expect(game.p1_defense.board[:d3]).to eq 's'
			end

			it 'Player 1 can move a cruiser' do
				game.move('c', 'a1', 'c3')
				expect(game.p1_defense.board[:a1]).to eq 'c'
				expect(game.p1_defense.board[:c3]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.move('b', 'a1', 'd4')
				expect(game.p1_defense.board[:a1]).to eq 'b'
				expect(game.p1_defense.board[:d4]).to eq 'b'
				expect(game.p1_defense.board[:b1]).not_to eq 'b'
				expect(game.p1_defense.board[:d2]).not_to eq 'b'
			end
		end
	end

end