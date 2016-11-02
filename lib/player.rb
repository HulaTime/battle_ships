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

end