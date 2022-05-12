require_relative 'modules.rb'
include SaveGame
class HangmanControls 
    attr_reader :name
    def initialize(name)
        @name = name 
    end

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
        wordslist      = File.open('./hangman_resources/hangman_guess_words.txt')
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
        image         = File.readlines('./hangman_resources/hangman_image.txt')
        frames        = hangman_frames
        display_frame = frames[position]
        image[display_frame].each do |line|
            p line.chomp
        end
    end
    
    def check_guess?(word,letter)
        word.include? letter 
    end

    def final_display(word)
        if win_track == word.length
            p"You win!"
        else
            p"The actual word was : #{real_word}"
            p"You lose!"
        end
    end

    def reply_to_wrong_guess(i, wrong_guesses, guess)
        wrong_guesses.push(guess)
        p"Your wrong guesses:"
        p wrong_guesses
        display_hangman_frame(i)
        i+=1
    end

    def reply_to_correct_guess(board, word, guess)
        p"Correct guess"
        #win_track+=1
        board[word.index(guess)] = guess
        p"The board:"
        p board
        position_of_guess        = word.index(guess)
        word[position_of_guess]  = nil
    end

    def start_game
        continue_game = ''
        win_track = 0
        i = 0
        board_with_word = dashboard_for_guessing
        word            = board_with_word[1].split('')
        board           = board_with_word[0]
        real_word       = word.join('')
        p"The board for this game"
        p board
        wrong_guesses   = []
        until i==6 || board.none? {|spaces| spaces=='-'}
            guess  = Gamer.letter_guess
            if guess == 'save'
                save_game(wrong_guesses, i, board, word, name)
                break
            end
            if !check_guess?(word,guess)==true
                reply_to_wrong_guess(i , wrong_guesses, guess)
            else
                reply_to_correct_guess(board, word, guess)
            end
        end
    end
    
    def continue_game(previous_progress)
        board_with_word = [previous_progress[:board],previous_progress[:word]]
        word            = [previous_progress[:word]]
        wrong_guesses   = [previous_progress[:wrong_guesses]]
        i               = [previous_progress[:i]]
        p"Your wrong guesses were:"
        p previous_progress[:wrong_guesses]
        p"The board when you left:"
        p previous_progress[:board]
        until i == 6 || previous_progress[:board].none? {|spaces| spaces == '-'}
            guess = Gamer.letter_guess
            if !check_guess?(word,guess)==true
                reply_to_wrong_guess(i, wrong_guesses, guess)
            else
                reply_to_correct_guess(board, word, guess)
            end
        end
    end
end

class Gamer < HangmanControls
    attr_reader :name
    def self.letter_guess
        p"Guess a letter!"
        guess = gets.chomp.downcase
        unless guess.to_i == 0
            p"Please input a valid guess"
            guess = gets.chomp.downcase
        end
        guess
    end
end
