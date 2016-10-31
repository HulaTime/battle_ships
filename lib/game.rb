class Game

	attr_reader :player_1, :player_2, :p1_defense, :p2_defense

	def initialize(player_1, player_2 = false)
		@player_1 = player_1
		@player_2 = player_2
		@p1_defense = nil
		@p2_defense = nil
	end

	def start(new_board)
		@p1_defense = new_board
		@p2_defense = new_board
	end

	def move(piece, x, y)
		if (x[0] != y[0]) && (x.slice(1..-1) != y.slice(1..-1))
			place_piece_diagonal(piece, x, y)
		else
			place_piece(piece, x, y)
		end
	end


	private

	def place_piece(type, x, y)
		for n in x[-1]..y[-1]
			for l in x[0]..y[0]
				@p1_defense.positions[(l + n.to_s).to_sym] = type
				@p1_defense.positions[(l + n.to_s).to_sym] = type
			end
		end
	end
end