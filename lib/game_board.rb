class GameBoard

	LETTER_ROW = " A  B  C  D  E  F  G  H  I  J"

	attr_reader :p1, :p2, :positions

	def initialize
		@positions = {}
		@board_display = ""

		for letter in 'a'..'j'
			for number in 1..10
				@positions[letter+number.to_s] = 0
			end
		end
	end

	def display
		row_num = 1
		@positions.each do |position, value|
			@board_display += "[_]" if position.length != 3
			if position.length == 3
				@board_display += "[_] #{row_num}\n"
				row_num += 1
			end
		end
		@board_display += LETTER_ROW
	end

end