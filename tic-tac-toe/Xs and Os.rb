class TicTacToe
    @@current_players=0
    def initialize(name)
        @name = name
        @@current_players += 1
        
    end
    def generate_board
        board=Array.new(3) {Array.new(3)}
        board
    end 
    def empty_boxes?
        board= generate_board
        p board.any? {|element| element.include?(nil)}
    end
end
player=TicTacToe.new("emeka")
player.generate_board
player.empty_boxes?