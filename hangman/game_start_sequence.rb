require 'yaml'
module SaveGame
    def save_game(wrong_guesses, i, board)
        hash                 = {}
        hash[:wrong_guesses] = wrong_guesses
        hash[:i]             = i 
        hash[:board]         = board
        Dir.mkdir('players') unless File.exists? 'players'
        player_filename = "./players/#{name}.yaml"
        File.open(player_filename,'w') do |file|
            file.puts YAML::dump(hash)
        end
    end
end

module LoadGame 
    def load_game(name)
        game_file = "./players/#{name}.yaml"
        loaded_game_file = File.read(game_file)
        saved_progress =YAML::load(loaded_game_file)
        p"Your wrong guesses were #{saved_progress[:wrong_guesses]}"
        p"The board when you left #{saved_progress[:board]}"
        saved_progress 
    end
end
