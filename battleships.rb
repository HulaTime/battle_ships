require 'io/console'
require './lib/game'
require './lib/player'
require './lib/game_board'

puts 'Welcome to Battleships!'
sleep 1
puts 'Are you playing alone or with a friend?'
puts '(Please enter 1 or 2)'

multiplayer_game = gets.chomp

puts "You have chosen a single player game,\nGenerating player boards"

game = Game.new(Player.new('Max'))

board = GameBoard.new

game.start(board)

10.times do
	sleep 0.2
	print '.'
end

puts
puts

puts game.p1_defense.display

turn = rand(2)

if turn == 0 then player_turn = 1 end
if turn == 1 then player_turn = 2 end

print "\n\n"

puts "It's player #{player_turn}'s turn\nPlease enter your move\nPosition (e.g a1:)"
position = gets.chomp

puts "Piece (Destroyer = 'd', Submarine = 's', Cruiser = 'c', Battleship - 'b':"
piece = gets.chomp

print position + ', ' + piece

