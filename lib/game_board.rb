class GameBoard

	LETTER_ROW = " A  B  C  D  E  F  G  H  I  J"

	attr_reader :display

	def initialize
		@display = ""
		for row_number in 1..10
			@display += ((("[_]" * 10) + " #{row_number}\n"))
		end
		@display += LETTER_ROW
	end
end