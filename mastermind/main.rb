module Mastermind
    PLAY_AREA=Array.new(12) {Array.new(4,0)}
    COLORS=['red','orange','white','purple','yellow']
    SELCTED_COLORS=COLORS.sample(4)#return any random 4 elements from array
end

class CodeMaker
    include Mastermind
    @@play_board=PLAY_AREA
    attr_reader :name
    def initialize(name=nil)
        @name=name
    end
    #if human decides to play
    def human_selection
        p "Choose your colour combo"
        human_preference=gets.chomp
        return human_preference
    end
    ###
    def check_mastermind
        if name != nil then ##human should choose
            chosen_colors=human_selection
        else
            chosen_colors=SELCTED_COLORS
        end
        check_board=@@play_board.select {|row| !row.include?(0)}
        round=0
        check_board.each do |colour_row|
            red_tag=0
            white_tag=0
            colour_row.each_with_index do |colour,position|
                #check for compatibility 
                if colour==chosen_colors[position] then 
                    red_tag+=1
                end
                if chosen_colors.include?(colour) && colour != chosen_colors[position]
                    white_tag+=1
                end
            end
            round += 1
            #winning condition
            if round==8
                p"CodeBreaker loses this round"
            end
            if red_tag==4 then
                p "CodeBreaker won this round"
                break
            end
            p "You got #{red_tag} red tags and #{white_tag} white tags  for this round: #{round}"
        end
    end
end
class CodeBreaker < CodeMaker
    def populate_board(row_position)
        p "What is your guess for this round?"
        guess_combination=[]
        4.times do
            guess=gets.chomp
            guess_combination.push(guess)
        end
        @@play_board[row_position]=guess_combination
    end
    def start_game
        p "The board for this game:"
        p @@play_board
        until check_mastermind.include?('won') || @@play_board.any? {|row| row.include?(0)}==false
            p "What row position"
            position=gets.chomp
            #in case a string is input accidentally
            if position.length > 1
                p "Position must be an integer"
                position=gets.chomp
            end
            board_location=position.to_i
            ####
            populate_board(board_location)
            check_mastermind
            p @@play_board
        end
    end
end
class CodeBreakerAuto < CodeMaker
    include Mastermind
    attr_reader :guess_combination_auto
    @@human_choice=human_preference
    @@guess_combination_auto=COLORS.sample(4)#initial guess to start with
    def populate_board_auto(row_position)
        p"Computer to guess please wait..."
        @@play_board[row_position]=guess_combination_auto
    end
    def human_feedback(board_position)#human to tell computer how close to breaking it is 
        p"Computer asking for how many red pegs"
        red_peg=gets.chomp
        p"Computer asking for how many white pegs"
        white_peg=gets.chomp
        return [red_peg,white_peg] 
    def work_on_feedback
        p"Working on it..."
        i=0
        populate_board_auto(i)
        human_report=human_feedback(i)
        if human_report.sum==4
            p"I see I got all colours right..."
            until guess_combination_auto==@@human_choice || @@play_board.any? {|row| row.include?(0)}==false
                i+=1
                guess_combination_auto.rotate!
                populate_board_auto(i)
                p"How about this?"
                p @@play_board
                human_report_1=human_feedback(i)
            end
            if guess_combination_auto==@@human_choice
                p"CodeBreaker Wins this round."
            end
        end

    def start_game 
        p "The board for this game"
        p @@play_board
        p "The computer will play this guess round, please wait..."
        work_on_feedback

#tests
player=CodeMaker.new('james')
player2=CodeBreaker.new('john')
player.human_selection
player2.start_game
# p player.name