class Game

	attr_reader :player_1, :player_2, :defense, :attack_log

	def initialize(player_1, player_2 = false)
		@player_1 = player_1
		@player_2 = player_2
		@player_turn = "p#{Kernel.rand(1..2)}"
		@defense = { p1: Hash.new, p2: Hash.new }
		@attack_log = { p1: [], p2: [] }
	end

	def attack(position)
		attack_log[@player_turn.to_sym].push(position)
		if @player_turn == "p1" then @player_turn = "p2" else @player_turn = "p1" end
	end

	def set_defense(x, y, piece)
		positions = []
		if x[0] == y[0]
			for n in x[1..-1].to_i..y[1..-1].to_i
				positions.push(x[0] + n.to_s)
			end
		else
			for l in x[0]..y[0]
				positions.push(l + x[1..-1].to_s)
			end
		end
		defense[@player_turn.to_sym][piece.to_sym] = positions
	end

	private

end