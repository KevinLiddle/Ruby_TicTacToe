$: << File.dirname( __FILE__)

require 'board'
require 'human_player'
require 'machine_player'
require 'moves'
require 'game_state'
require 'game_tree'
require 'game'

game = Game.new

game.play