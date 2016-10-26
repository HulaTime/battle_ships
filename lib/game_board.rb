class GameBoard

	LETTER_ROW = " A  B  C  D  E  F  G  H  I  J"

	attr_reader :p1, :p2

	def initialize
		@p1 = {} 
		@p2 = {}
		@board_display = ""

		for letter in 'a'..'j'
			for number in 1..10
				@p1[letter+number.to_s] = 0
				@p2[letter+number.to_s] = 0	
			end
		end
	end

	def display
		row_num = 1
		p1.each do |position, value|
			@board_display += "[_]" if position.length != 3
			if position.length == 3
				@board_display += "[_] #{row_num}\n"
				row_num += 1
			end
		end
		@board_display += LETTER_ROW
		puts @board_display
	end

end