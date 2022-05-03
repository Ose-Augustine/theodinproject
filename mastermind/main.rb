require_relative "computer_algorithm.rb"
include ComputerAlgorithm
module Mastermind
    PLAY_AREA=Array.new(12) {Array.new(4,0)}
    COLORS=['red','orange','white','purple','yellow']
    SELCTED_COLORS=COLORS.sample(4)#return any random 4 elements from array
end

class CodeMaker
    include Mastermind
    @@play_board=PLAY_AREA
    def initialize(name=nil)
        @name=name
    end
    def check_mastermind
        check_board=@@play_board.select {|row| !row.include?(0)}
        round=0
        check_board.each do |colour_row|
            red_tag=0
            white_tag=0
            #In case computer is to be code breaker
            chosen_colors=SELCTED_COLORS
            colour_row.each_with_index do |colour,position|
                #check for compatibility 
                if colour==chosen_colors[position] then 
                    red_tag+=1
                end
                if chosen_colors.include?(colour) && colour != chosen_colors[position]
                    white_tag+=1
                end
            end
            #winning condition
            if round==12
                p"CodeBreaker loses this round"
            end
            if red_tag==4 then
                p "CodeBreaker won this round"
                break
            end
            round += 1
            p "You got #{red_tag} red tags and #{white_tag} white tags  for this round: #{round}"
        end
    end
end
class CodeBreaker < CodeMaker
    def populate_board(row_position)
        guess_combo=[]
        p "What is your guess for this round?"
        4.times do
            guess=gets.chomp
            guess_combo.push(guess)
        end
        @@play_board[row_position]=guess_combo
    end
    def start_game
        if (@name.is_a? String) == false #in case computer is code breaker
            ComputerAlgorithm.computer_subsequent_turns
        else
            p "The board for this game:"
            p @@play_board
            i=0
            board_location=0
            position=0
            until @@play_board.any? {|row| row.include?(0)}==false
                p "What row position"
                position=gets.chomp
                #in case a string is input accidentally
                if position.length > 1
                    p "Position must be an integer"
                    position=gets.chomp
                end
                board_location=position.to_i
                ###
                populate_board(board_location)
                check_mastermind
                p @@play_board
             end
        end
    end
end


#tests
player=CodeMaker.new('james')
player2=CodeBreaker.new
#p player.color
#p CodeBreaker.coloured
#CodeMaker.play_board
#p player2.guess_combination
# p player2.name
# p player.name.is_a? String
#player3=CodeBreakerAuto.new
# player3.start_game
# p player3.start_game
# player.human_selection
player2.start_game
# p player.name 
# p Mastermind::COLORS.sample(2)
#p player2.guess_combination