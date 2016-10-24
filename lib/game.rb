class Game

	attr_reader :player_1, :player_2, :p1_defense, :p2_board

	def initialize(player_1, player_2 = nil)
		@player_1 = player_1
		@player_2 if !player_2
		@p1_defense = nil
		@p2_board = nil
	end

	def start(new_board)
		@p1_defense = new_board.p1
		@p2_board = new_board.p2
		print "Welcome #{@player_1}, you move first..."
	end

	def p1_move(piece, x, y)
		if piece == 'd'
			@p1_defense[x.to_sym] = piece
			@p1_defense[y.to_sym] = piece
		elsif piece == 's'
			if x[0] == y[0]
				for n in x[-1]..y[-1]
					@p1_defense[(x[0] + n.to_s).to_sym] = 's'
					@p1_defense[(x[0] + n.to_s).to_sym] = 's'
				end
			end
		elsif piece == 'c'
			if x[0] == y[0]
				for n in x[-1]..y[-1]
					@p1_defense[(x[0] + n.to_s).to_sym] = 'c'
					@p1_defense[(x[0] + n.to_s).to_sym] = 'c'
				en
d			end
		else
			if x[0] == y[0]
				for n in x[-1]..y[-1]
					@p1_defense[(x[0] + n.to_s).to_sym] = 'b'
					@p1_defense[(x[0] + n.to_s).to_sym] = 'b'
				end
			end
		end
	end

end