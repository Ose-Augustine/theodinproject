module SaveGame
    def save_game(wrong_guesses, i, board, word, name,win_track,real_word)
        hash                 = {}
        hash[:real_word]     = real_word
        hash[:word]          = word 
        hash[:wrong_guesses] = wrong_guesses
        hash[:i]             = i 
        hash[:board]         = board
        hash[:win_track]     = win_track
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
        saved_progress 
    end
end