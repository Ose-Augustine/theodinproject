# frozen_string_literal: true

module SaveGame
  def save_game(wrong_guesses, i_value, board, word, name, win_track, real_word)
    hash = {}
    hash[:real_word]     = real_word
    hash[:word]          = word
    hash[:wrong_guesses] = wrong_guesses
    hash[:i_value]       = i_value
    hash[:board]         = board
    hash[:win_track]     = win_track
    Dir.mkdir('players') unless File.exist? 'players'
    player_filename = "./players/#{name}.yaml"
    File.open(player_filename, 'w') do |file|
      file.puts YAML.dump(hash)
    end
  end
end

# module to load game
module LoadGame
  def load_game(name)
    game_file = "./players/#{name}.yaml"
    loaded_game_file = File.read(game_file)
    Psych.unsafe_load(loaded_game_file)
  end
end
