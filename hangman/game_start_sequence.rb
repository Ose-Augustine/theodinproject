# frozen_string_literal: true

p "To start a new game, press 1. \n To continue a previously saved game, press 2."
p "To save your current game, press 'save' as your guess when asked for a guess."
choice = gets.chomp

require 'yaml'
require_relative 'main'
require_relative 'modules'
include LoadGame
def game_start_sequence(choice)
  case choice
  when '1'
    p 'Your name:'
    player_name = gets.chomp
    controller  = HangmanControls.new(player_name.to_s)
    player      = Gamer.new(player_name.to_s)
    controller.start_game
  when '2'
    p 'Your name:'
    player_name = gets.chomp
    controller = HangmanControls.new(player_name.to_s)
    previous_progress = load_game(player_name)
    controller.continue_game(previous_progress)
  end
end
game_start_sequence(choice)
