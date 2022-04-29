class Mastermind
    @@play_board=Array.new(9) {Array.new(4,0)}
    def display
        @@play_board
    end
end

class CodeMaker < Mastermind
    COLORS=['red','orange','white','purple','yellow']
    def initialize(name)
        @name=name
    end
    def random_from_colors
        code_maker_colors=COLORS.sample(4)#return any random 4 elements from array
    end
    def check_mastermind
        chosen_colors=random_from_colors
        check_board=@@play_board.select {|row| !row.include?(0)}
        check_board.each do |colour_row|
            round=0
            red_tag=0
            white_tag=0
            colour_row.each_with_index do |colour,position| 
                if colour==chosen_colors[position] then 
                    red_tag+=1
                if chosen_colors.include?(colour) && colour != chosen_colors[position]
                    white_tag+=1
                end
                round+=1
            p "You got #{red_tag} and #{white_tag} for this round: #{round}."
        end
    end
end
class CodeBreaker
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
    end
    
end

#tests
player=CodeMaker.new('emeka')
game=Mastermind.new
p player.check_mastermind
p game.display
p player.random_from_colors
