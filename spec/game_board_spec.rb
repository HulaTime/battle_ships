require 'game_board'

describe GameBoard do

	subject(:board) { described_class.new }

	display = "[_][_][_][_][_][_][_][_][_][_] 1\n" +
						"[_][_][_][_][_][_][_][_][_][_] 2\n" +
						"[_][_][_][_][_][_][_][_][_][_] 3\n" +
						"[_][_][_][_][_][_][_][_][_][_] 4\n" +
						"[_][_][_][_][_][_][_][_][_][_] 5\n" +
						"[_][_][_][_][_][_][_][_][_][_] 6\n" +
						"[_][_][_][_][_][_][_][_][_][_] 7\n" +
						"[_][_][_][_][_][_][_][_][_][_] 8\n" +
						"[_][_][_][_][_][_][_][_][_][_] 9\n" +
						"[_][_][_][_][_][_][_][_][_][_] 10\n" +
						" A  B  C  D  E  F  G  H  I  J"
	
	context 'Initialization' do
		it 'GameBoard should record all board positions and values' do
			expect(board.positions.class).to eq Hash
			board.positions.each do |location, value|
				expect(board.positions[location]).to eq 0
			end
		end

		it 'GameBoard should have a 2D display for the user to see moves' do
			expect(board.board_display).to eq display
		end
	end
	
end