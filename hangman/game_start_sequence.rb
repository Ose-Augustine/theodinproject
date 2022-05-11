p"To start a new game, press 1. \n To continue a previously saved game, press 2."
p"To save your current game, press 'save' as your guess when asked for a guess."
choice = gets.chomp 

require 'yaml'
require_relative 'main.rb'
require_relative 'modules.rb'
include LoadGame
def game_start_sequence(choice)
    if choice == '1'
        controller = HangmanControls.new
        p"Your name:"
        player_name = gets.chomp
        player = Gamer.new("#{player_name}")
        controller.start_game 
    elsif
        choice == '2'
        p"Your name:"
        player_name = gets.chomp 
        previous_progress = load_game(name) 
        continue_game(previous_progress)
    end
end
game_start_sequence(choice)
