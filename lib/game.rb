class Game

	attr_reader :player_1, :player_2, :defense, :attack_log

	def initialize(player_1, player_2 = false)
		@player_1 = player_1
		@player_2 = player_2
		@player_turn = "p#{Kernel.rand(1..2)}".to_sym
		@defense = { p1: Hash.new, p2: Hash.new }
		@attack_log = { p1: [], p2: [] }
	end

	def attack(position)
		return error("OOB") if out_of_bounds?(position)
		return error("Overlap") if attacked?(position)
		attack_log[@player_turn].push(position)
		change_turn_if_multi_player
	end

	def set_defense(x, y, piece)
		return error("OOB") if (out_of_bounds?(x) || out_of_bounds?(y))
		return error("Overlap") if position_occupied?(x, y)
		position = set_vertical_piece(x, y) if x[0] == y[0]
		position = set_horizontal_piece(x, y) if x[0] != y[0]
		defense[@player_turn][piece.to_sym] = position
		change_turn_if_multi_player
	end

	def p1_hits
		hits = []
		attack_log[:p1].each do |attack|
			@defense[:p2].each do |piece, locations|
				if locations.include?(attack)
					hits.push(attack)
				end
			end
		end
		hits
	end

	def p2_hits
		hits = []
		attack_log[:p2].each do |attack|
			@defense[:p1].each do |piece, locations|
				if locations.include?(attack)
					hits.push(attack)
				end
			end
		end
		hits
	end

	def p1_misses
		misses = []
		attack_log[:p1].each do |attack|
			@defense[:p2].each do |piece, locations|
				unless locations.include?(attack)
					misses.push(attack)
				end
			end
		end
		misses
	end

	def p2_misses
		misses = []
		attack_log[:p2].each do |attack|
			@defense[:p1].each do |piece, locations|
				unless locations.include?(attack)
					misses.push(attack)
				end
			end
		end
		misses
	end

	def view_board
	end

	private

	def out_of_bounds?(position)
		if ((position[0] > 'j' || position[1..-1].to_i > 10)) then return true end
		if ((position[0] < 'a' || position[1..-1].to_i < 1)) then return true end
	end

	def error(type = 'unknown')
		return "Error: Something went wrong" if type == 'unknown'
		return "Error: Out of bounds" if type == "OOB"
		return "Error: Placement overlaps" if type == "Overlap"
	end

	def attacked?(position)
		if attack_log[@player_turn].include?(position) then return true end
	end

	def position_occupied?(x, y)
		if x[0] == y[0] && defense[@player_turn].empty? == false
			for n in x[1..-1].to_i..y[1..-1].to_i
				position = x[0] +	n.to_s
				defense[@player_turn].each do |piece, existing_positions|
				return true if existing_positions.include?(position) end
			end
		elsif x[1..-1] == y[1..-1] && defense[@player_turn].empty? == false
			for l in x[0]..y[0]
				position = l + x[1..-1]
				defense[@player_turn].each do |piece, existing_positions|
				return true if existing_positions.include?(position) end
			end
		end
	end

	def change_turn_if_multi_player
		if @player_2 != false
			if @player_turn == :p1 then @player_turn = :p2 else @player_turn = :p1 end
		end
	end

	def set_vertical_piece(x, y)
		positions = []
		for n in x[1..-1].to_i..y[1..-1].to_i
			positions.push(x[0] + n.to_s)
		end
		return positions
	end

	def set_horizontal_piece(x, y)
		positions = []
		for l in x[0]..y[0]
			positions.push(l + x[1..-1])
		end
		return positions
	end

end