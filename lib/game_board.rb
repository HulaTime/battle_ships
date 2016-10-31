class GameBoard

	LETTER_ROW = " A  B  C  D  E  F  G  H  I  J"

	attr_reader :positions, :display

	def initialize
		@positions = {}
		@display = ""

		for letter in 'a'..'j'
			for number in 1..10
				@positions[letter+number.to_s] = 0
			end
		end

		row_num = 1
		@positions.each do |position, value|
			@display += "[_]" if position.length != 3
			if position.length == 3
				@display += "[_] #{row_num}\n"
				row_num += 1
			end
		end
		@display += LETTER_ROW
	end

	def update(position, value)
		positions[position] = value
	end

end