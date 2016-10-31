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

	def high_number(x, y)
		return x if x > y
		return y if y > x
	end

	def low_number(x, y)
		return y if x > y
		return x if y > x
	end

	def find_number_range(x, y)
		range = []
		for n in x..y
			range.push(n)
		end
		return range
	end

	def high_letter(a, b)
		return a if a > b
		return b if a < b
	end

	def low_letter(a, b)
		return a if a < b
		return b if a > b
	end

	def find_letter_range(a, b)
		range, current_letter = [], a
		until current_letter == b.next
			range.push(current_letter)
			current_letter = current_letter.next
		end
		return range
	end

end