require 'game'

describe Game do

	subject(:game) { described_class.new(player_1, player_2) }
	
	let(:game_board_h) { 
		double :game_board_h,
		  p1: {a1:nil,a2:nil,a3:nil,a4:nil},
			p2: {a1:nil,a2:nil,a3:nil,a4:nil}
		}

	let(:game_board_v) { 
		double :game_board_v,
		  p1: {a1:nil,b1:nil,c1:nil,d1:nil},
			p2: {a1:nil,a2:nil,a3:nil,a4:nil}
		}

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
		expect { game.start(game_board_h) }.to output('Welcome Max, you move first...').to_stdout
	end

	it 'Starting a new game generates a new board' do
		game.start(game_board_h)
		expect(game.p1_defense).to eq game_board_h.p1
		expect(game.p2_defense).to eq game_board_h.p2
	end

	context 'Game started' do

		context 'Possible Moves horizontally' do
			before do
				game.start(game_board_h)
			end

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
			before do
				game.start(game_board_v)
			end

			it 'Player 1 can move a destroyer' do
				game.p1_move('d', 'a1', 'b1')
				expect(game.p1_defense).to eq({
					a1:'d', b1:'d', c1:nil, d1:nil
				})
			end

			it 'Player 1 can move a submarine' do
				game.p1_move('s', 'a1', 'c1')
				expect(game.p1_defense).to eq({
					a1:'s', b1:'s', c1:'s', d1:nil
				})
			end

			it 'Player 1 can move a cruiser' do
				game.p1_move('c', 'a1', 'c1')
				expect(game.p1_defense).to eq({
					a1:'c', b1:'c', c1:'c', d1:nil
				})
			end

			it 'Player 1 can move a battleship' do
				game.p1_move('b', 'a1', 'd1')
				expect(game.p1_defense).to eq({
					a1:'b', b1:'b', c1:'b', d1:'b'
				})
			end
		end
	end
end