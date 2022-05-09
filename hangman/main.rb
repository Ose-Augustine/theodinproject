class HangManControls
    def dashboard_for_guessing
        word = extract_random_guess_word
        board = Array.new(word.length,'-')
        p word
        board 
    end

    def required_length?(word)
        word.length >= 5 || word.length <= 20
    end

    def extract_random_guess_word
        wordslist      = File.open('hangman_guess_words.txt')
        lines          = wordslist.readlines
        selected_words = lines.select {|word| required_length?(word)}
        selected_words.sample.chomp
    end
end
class Gamer < HangmanControls 
    attr_reader :name
    def initialize(name)
        @name = name
    end
end
player1 = HangManControls.new('emeka')
p player1.dashboard_for_guessing