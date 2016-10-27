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

10.times do
	sleep 0.2
	print '.'
end

puts
puts

puts board.display