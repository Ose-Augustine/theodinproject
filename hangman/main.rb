class HangmanControls
    def dashboard_for_guessing
        word  = extract_random_guess_word
        board = Array.new(word.length,'-')
        [board,word]
    end

    def required_length?(word)
        range = (5..20).to_a
        range.include? word.chomp.length
    end

    def extract_random_guess_word
        wordslist      = File.open('hangman_guess_words.txt')
        lines          = wordslist.readlines
        selected_words = lines.select {|word| required_length?(word)}
        selected_words.sample.chomp
    end

    def hangman_frames
        frame1 = 1..7
        frame2 = 8..14
        frame3 = 15..21
        frame4 = 22..28
        frame5 = 29..35
        frame6 = 36..42
        frame7 = 43..49
        [frame1, frame2, frame3, frame4, frame5,frame6, frame7]
    end
    
    def display_hangman_frame(position)
        image = File.open('hangman_image.txt')
        lines = image.readlines
        frames = hangman_frames
        display_frame = frames[position]
        lines[display_frame].each do |line|
            p line.chomp
        end
    end
    
    def check_guess?(word,letter)
        word.include? letter 
    end

    def start_game
        i = 0
        board_with_word = dashboard_for_guessing
        word  = board_with_word[1]
        board = board_with_word[0]
        wrong_guesses = []
        until i==6 || board.none? {|spaces| spaces=='-'}
            guess = Gamer.letter_guess
            if !check_guess?(word,guess)==true
                wrong_guesses.push(guess)
                p"Your wrong guesses: #{wrong_guesses}"
                display_hangman_frame(i)
                i+=1
            else
                board[word.index(guess)] = guess
                word.delete_at(word.index(guess))
            end
        end
    end

end
class Gamer < HangmanControls 
    def initialize(name)
        @name = name
    end
    def self.letter_guess
        p"Guess a letter!"
        guess = gets.chomp
        guess
    end
end
player1 = HangmanControls.new 
player2 = Gamer.new("emeka")
p player1.dashboard_for_guessing