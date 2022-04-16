class TicTacToe
    @@current_players=0
    def initialize(name)
        @name = name
        
    end
    def generateBoard
        board=Array.new(3) {Array.new(3)}
        board.each {|element| p element}
    end 
end
player=TicTacToe.new("emeka")
player.generateBoard