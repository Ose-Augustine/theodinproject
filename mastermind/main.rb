module Mastermind
    PLAY_AREA=Array.new(9) {Array.new(4,0)}
    COLORS=['red','orange','white','purple','yellow']
    SELCTED_COLORS=COLORS.sample(4)#return any random 4 elements from array
end

class CodeMaker
    include Mastermind
    @@play_board=PLAY_AREA
   
    def initialize(name)
        @name=name
    end
    def check_mastermind
        chosen_colors=SELCTED_COLORS
        check_board=@@play_board.select {|row| !row.include?(0)}
        round=0
        check_board.each do |colour_row|
            red_tag=0
            white_tag=0
            colour_row.each_with_index do |colour,position| 
                if colour==chosen_colors[position] then 
                    red_tag+=1
                end
                if chosen_colors.include?(colour) && colour != chosen_colors[position]
                    white_tag+=1
                end
            end
            round += 1
            #winning condition
            if red_tag==4 then
                p "CodeBreaker won this round"
                break 
            end
            p "You got #{red_tag} red tags and #{white_tag} white tags  for this round: #{round}"
        end
    end
end
class CodeBreaker < CodeMaker
    def initialize(name)
        @name=name
    end
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
        until @@play_board.any? {|row| row.include?(0)}==false
            p "What row position"
            position=gets.chomp.to_i
            populate_board(position)
            check_mastermind
            p @@play_board
        end
    end
end

#tests
player=CodeMaker.new('emeka')
player2=CodeBreaker.new('john')
player2.start_game