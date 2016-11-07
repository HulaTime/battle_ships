class Game

	attr_reader :player_1, :player_2, :defense, :attack_log, :player_turn

	def initialize(player_1, player_2 = false)
		@player_1 = player_1
		@player_2 = player_2
		@player_turn = "p#{Kernel.rand(1..2)}".to_sym
		@defense = { p1: Hash.new, p2: Hash.new }
		generate_comp_defense if player_2 == false
		@attack_log = { p1: [], p2: [] }
	end

	def attack(position)
		return error("OOB") if out_of_bounds?(position)
		return error("Overlap") if attacked?(position)
		attack_log[player_turn].push(position)
		change_turn_if_multi_player
	end

	def set_defense(x, y, piece)
		return error("OOB") if (out_of_bounds?(x) || out_of_bounds?(y))
		return error("Overlap") if position_occupied?(x, y)
		set_piece(x, y, piece)
		change_turn_if_multi_player
	end

	def hits(player = player_turn.to_s)
		hits = []
		attack_log[player.to_sym].each do |attack|
			@defense[waiting_player(player.to_sym)].each do |piece, locations|
				if locations.include?(attack)
					hits.push(attack)
				end
			end
		end
		hits
	end

	def misses(player = player_turn.to_s)
		misses = []
		attack_log[player.to_sym].each do |attack|
			@defense[waiting_player(player.to_sym)].each do |piece, locations|
				unless locations.include?(attack)
					misses.push(attack)
				end
			end
		end
		misses
	end

	# private

	SHIPS = {d:2, s:3, c:4, b:5}

	def generate_comp_defense
		SHIPS.each do |ship, size|
		Kernel.rand(1..2) == 1 ? horizontal = true : horizontal = false
		x = (('a'..'j').to_a.sample) + ((1..10).to_a.sample.to_s)
			if horizontal == true
				if x[1..-1].to_i <= 5
					y = x[0] + (x[1..-1].to_i + (size - 1)).to_s
					set_piece(x,y,ship,:p2)
				else
					y = x[0] + (x[1..-1].to_i - (size - 1)).to_s
					set_piece(y,x,ship,:p2)
				end
			else
				if x[0] <= 'e'
					letter = x[0]
					(size - 1).times { letter = (letter.ord + 1).chr }
					set_piece(x,(letter + x[1..-1]),ship,:p2)
				else
					letter = x[0]
					(size - 1).times { letter = (letter.ord - 1).chr }
					set_piece((letter + x[1..-1]),x,ship,:p2)
				end
			end
		end
	end

	def waiting_player(current_player = player_turn)
		current_player_num = current_player.to_s[-1].to_i
		return :p2 if current_player_num == 1
		return :p1 if current_player_num == 2
	end

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
		if attack_log[player_turn].include?(position) then return true end
	end

	def position_occupied?(x, y)
		if x[0] == y[0] && defense[player_turn].empty? == false
			for n in x[1..-1].to_i..y[1..-1].to_i
				position = x[0] +	n.to_s
				defense[player_turn].each do |piece, existing_positions|
				return true if existing_positions.include?(position) end
			end
		elsif x[1..-1] == y[1..-1] && defense[player_turn].empty? == false
			for l in x[0]..y[0]
				position = l + x[1..-1]
				defense[player_turn].each do |piece, existing_positions|
				return true if existing_positions.include?(position) end
			end
		end
	end

	def set_piece(x, y, piece, player = player_turn)
		positions = []
		if x[0] == y[0]
			for n in x[1..-1].to_i..y[1..-1].to_i
				positions.push(x[0] + n.to_s)
			end
		else
			for l in x[0]..y[0]
				positions.push(l + x[1..-1])
			end
		end
		defense[player][piece.to_sym] = positions
	end

	def change_turn_if_multi_player
		if player_2 != false
			player_turn == :p1 ? @player_turn = :p2 : @player_turn = :p1
		end
	end

end
	# positions = []
	# 			count = initial_number.to_i
	# 			size.times do
	# 				position = initial_letter + count.to_s
	# 				positions.push(position)
	# 				count += 1
	# 			end
	# 				defense[:p2][ship] = positions