class HangManControls
    def dashboard_for_guessing
        word  = extract_random_guess_word
        board = Array.new(word.length,'-')
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

    def hangman_frames
        frame1 = [1..7]
        frame2 = [8..14]
        frame3 = [15..21]
        frame4 = [22..28]
        frame5 = [29..35]
        frame6 = [36..42]
        frame7 = [43..49]
        [frame1, frame2, frame3, frame4, frame5,frame6, frame7]
    end
    
    def display_hangman_frame(position)
        image = File.open('hangman_image.txt')
        lines = image.readlines
        frames = hangman_frame
        lines[frames[position]].each do |line|
            p line.chomp
        end
    end
    
    def check_guess?(word,letter)
        word.include? letter 
    end
    def start_game
        i = 0
        board = dashboard_for_guessing
        word  = extract_random_guess_word
        guess = letter_guess
        wrong_guesses = []
        if !check_guess?(word,guess)==true
            wrong_guesses.push(guess)
            p"Your wrong guesses: #{wrong_guesses}"
            display_hangman_frame(i)
        end
    end

end
class Gamer < HangmanControls 
    attr_reader :game_board
    @@game_board = dashboard_for_guessing
    def initialize(name)
        @name = name
    end
    def letter_guess
        p"Guess a letter!"
        guess = gets.chomp
        guess
    end
end
player1 = HangManControls.new('emeka')
p player1.dashboard_for_guessing