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
		it 'GameBoard should have a 2D display for the user to see moves' do
			expect(board.display).to eq display
		end
	end
	
end