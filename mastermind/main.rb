class Mastermind
    play_board=Array.new(9) {Array.new(4)}
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
    end
end

player=CodeMaker.new('emeka')
p player.random_from_colors
