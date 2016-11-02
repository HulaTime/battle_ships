require 'game'
require 'player'
require 'game_board'

player_1 = Player.new('Max')
player_2 = false

game = Game.new(player_1)

game.set_defense('a1', 'a5', 'b')
game.set_defense('b1', 'b3', 'c')
game.set_defense('c1', 'c2', 'd')
game.set_defense('d1', 'd2', 's')