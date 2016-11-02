class Player

	attr_reader :name, :attack_log, :defense_log, :ship_positions

	def initialize(name)
		@name = name
		@attack_log = Array.new
		@ship_positions = Hash.new
	end

	def attack(position)
		attack_log.push(position)
	end

	def defense(pos_1, pos_2, piece)
		positions = []
		if pos_1[0] == pos_2[0]
			for n in pos_1[1..-1].to_i..pos_2[1..-1].to_i
				positions.push(pos_1[0] + n.to_s)
			end
		else
			for l in pos_1[0]..pos_2[0]
				positions.push(l + pos_1[1..-1].to_s)
			end
		end
		ship_positions[piece.to_sym] = positions
	end

end