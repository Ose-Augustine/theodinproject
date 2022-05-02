module Mastermind
    PLAY_AREA=Array.new(12) {Array.new(4,0)}
    COLORS=['red','orange','white','purple','yellow']
    SELCTED_COLORS=COLORS.sample(4)#return any random 4 elements from array
end

class CodeMaker
    include Mastermind
    @@play_board=PLAY_AREA
    attr_reader :name ,:color
    def initialize(name=nil)
        @name=name
    end
    #if human decides to play
    def self.human_selection
        p "Choose your colour combo"
        human_preference=gets.chomp
        human_preference
    end
    ###
    def check_mastermind
        check_board=@@play_board.select {|row| !row.include?(0)}
        round=0
        check_board.each do |colour_row|
            red_tag=0
            white_tag=0
            #In case computer is to be code breaker
            if !name.is_a? String
                p @@play_board
                p"How many red pegs?"
                red_tag=gets.chomp
                p"How many white pegs?"
                white_tag=gets.chomp
                number_of_pegs=CodeBreaker.examine_pegs(red_tag,white_tag)
                work_on_peg_feedback(number_of_pegs)
                if round==11
                    p"CodeBreaker loses this round"
                end
                if red_tag==4 then
                    p "CodeBreaker won this round"
                    break
                end
                round += 1
                p "Computer got #{red_tag} red tags and #{white_tag} white tags  for this round: #{round}"
            else
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
end
class CodeBreaker < CodeMaker
    attr_reader :guess_combination ,:colours
    @@colours=['red','orange','white','purple','yellow']
    @@guess_combination=@@colours.sample(4)
    def self.coloured
        @@guess_combination
    end
    def self.examine_pegs(red,white)
        pegs=[red.to_i,white.to_i]
        pegs.to_a.sum
    end
    def work_on_peg_feedback(pegs)
        if pegs < 4
            @@guess_combination=@@colours.sample(4)
        else
            @@guess_combination.rotate!
        end
    end

    def populate_board(row_position)
        guess_combo=[]
        if !@name.is_a? String
            guess_combo=@@guess_combination
        else
            p "What is your guess for this round?"
            4.times do
                guess=gets.chomp
                guess_combo.push(guess)
            end
        end
        @@play_board[row_position]=guess_combo
    end
    def start_game
        p "The board for this game:"
        p @@play_board
        i=0
        board_location=0
        position=0
        until @@play_board.any? {|row| row.include?(0)}==false
            if (@name.is_a? String) == false #in case computer is code breaker
                range_of_positions=(0..11)
                position_to_choose_from=range_of_positions.to_a
                position=position_to_choose_from[i]
                i+=1
                board_location=position
            else
                p "What row position"
                position=gets.chomp
                 #in case a string is input accidentally
                if position.length > 1
                    p "Position must be an integer"
                    position=gets.chomp
                end
                board_location=position.to_i
            end
            ####
            populate_board(board_location)
            check_mastermind
            p @@play_board
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