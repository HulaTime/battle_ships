class Player

	attr_reader :name, :attack_log, :defense_log

	def initialize(name)
		@name = name
		@attack_log = Hash.new
		@defense_log = Hash.new
	end

	def attack(position, piece)
		attack_log[position.to_sym] = piece
	end

	def defense(pos_1, pos_2, piece)
		defense_log[piece.to_sym] = [pos_1, pos_2]
	end

end