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
		if (x[0] == y[0]) || (x.slice(1..-1) == y.slice(1..-1))
			place_piece(piece, x, y)
		else
			place_piece_diagonal(piece, x, y)
		end
	end


	private

	DESTROYER = 'd'
	SUBMARINE = 's'
	CRUISER = 'c'
	BATTLESHIP = 'b'

	def place_piece_diagonal(type, x, y)
		high_num = high_number(x.slice(1..-1).to_s, y.slice(1..-1).to_s)
		low_num = low_number(x.slice(1..-1).to_s, y.slice(1..-1).to_s)
		num_range = find_number_range(low_num, high_num)

		high_let = high_letter(x[0], y[0])
		low_let = low_letter(x[0], y[0])
		let_range = find_letter_range(low_let, high_let)

		count = (num_range[0].to_i - 1)
		coordinates = []

		let_range.each do |letter|			
			count += 1
			num_range.each do |num|
				coord = (letter + num.to_s) if num.to_i == count
				coordinates.push(coord) if coord != nil
			end
		end

		coordinates.each do |coord|
			@p1_defense.board[coord] = 'b'
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