class Game

	attr_reader :player_1, :player_2, :p1_board, :p2_board

	def initialize(player_1, player_2 = nil)
		@player_1 = player_1
		@player_2 if !player_2
		@p1_board = nil
		@p2_board = nil
	end

	def start(new_board)
		@p1_board = new_board.p1
		@p2_board = new_board.p2
		print "Welcome #{@player_1}, you move first..."
	end

	def p1_destroyer(x, y)
	end

	def p1_submarine(x, y)
	end

	def p1_cruiser(x, y)
	end

	def p1_battleship(x, y)
	end

end