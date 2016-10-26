require 'game'

describe Game do

	subject(:game) { described_class.new(player_1, player_2) }
	
	let(:player_1) { 'Max' }
	let(:player_2) { double :player_2, name: '' }

	let(:game_board) { 
		double :game_board,
		  p1: {a1:nil,b1:nil,c1:nil,d1:nil,
		  		 a2:nil,b2:nil,c2:nil,d2:nil,
		  		 a3:nil,b3:nil,c3:nil,d3:nil,
		  		 a4:nil,b4:nil,c4:nil,d4:nil},
		  p2: {a1:nil,b1:nil,c1:nil,d1:nil,
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

	it 'An initialized game generates a message once started' do
		expect { game.start(game_board) }.to output('Welcome Max, you move first...').to_stdout
	end

	it 'Starting a new game generates a new board' do
		game.start(game_board)
		expect(game.p1_defense).to eq game_board.p1
		expect(game.p2_defense).to eq game_board.p2
	end

	context 'Game started' do

		context 'Possible Moves horizontally' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.p1_move('d', 'a1', 'a2')
				expect(game.p1_defense[:a1]).to eq 'd'
				expect(game.p1_defense[:a2]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.p1_move('s', 'a1', 'a3')
				expect(game.p1_defense[:a1]).to eq 's'
				expect(game.p1_defense[:a2]).to eq 's'
				expect(game.p1_defense[:a3]).to eq 's'
			end

			it 'Player 1 can move a cruiser' do
				game.p1_move('c', 'a1', 'a3')
				expect(game.p1_defense[:a1]).to eq 'c'
				expect(game.p1_defense[:a2]).to eq 'c'
				expect(game.p1_defense[:a3]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.p1_move('b', 'a1', 'a4')
				expect(game.p1_defense[:a1]).to eq 'b'
				expect(game.p1_defense[:a2]).to eq 'b'
				expect(game.p1_defense[:a3]).to eq 'b'
				expect(game.p1_defense[:a4]).to eq 'b'
			end
		end

		context 'Possible Moves vertically' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.p1_move('d', 'a1', 'b1')
				expect(game.p1_defense[:a1]).to eq 'd'
				expect(game.p1_defense[:b1]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.p1_move('s', 'a1', 'c1')
				expect(game.p1_defense[:a1]).to eq 's'
				expect(game.p1_defense[:b1]).to eq 's'
				expect(game.p1_defense[:c1]).to eq 's'

			end

			it 'Player 1 can move a cruiser' do
				game.p1_move('c', 'a1', 'c1')
				expect(game.p1_defense[:a1]).to eq 'c'
				expect(game.p1_defense[:b1]).to eq 'c'
				expect(game.p1_defense[:c1]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.p1_move('b', 'a1', 'd1')
				expect(game.p1_defense[:a1]).to eq 'b'
				expect(game.p1_defense[:b1]).to eq 'b'
				expect(game.p1_defense[:c1]).to eq 'b'
				expect(game.p1_defense[:d1]).to eq 'b'
			end
		end

		context 'Possible Moves diagonally' do
			before do
				game.start(game_board)
			end

			it 'Player 1 can move a destroyer' do
				game.p1_move('d', 'a1', 'b2')
				expect(game.p1_defense[:a1]).to eq 'd'
				expect(game.p1_defense[:b2]).to eq 'd'
			end

			it 'Player 1 can move a submarine' do
				game.p1_move('s', 'a1', 'd3')
				expect(game.p1_defense[:b1]).to eq 's'
				expect(game.p1_defense[:d3]).to eq 's'
			end

			it 'Player 1 can move a cruiser' do
				game.p1_move('c', 'a1', 'c3')
				expect(game.p1_defense[:a1]).to eq 'c'
				expect(game.p1_defense[:c3]).to eq 'c'
			end

			it 'Player 1 can move a battleship' do
				game.p1_move('b', 'a1', 'd4')
				expect(game.p1_defense[:a1]).to eq 'b'
				expect(game.p1_defense[:d4]).to eq 'b'
			end
		end
	end

end