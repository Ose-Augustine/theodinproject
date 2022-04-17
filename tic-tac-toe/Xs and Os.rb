
class TicTacToe
    @@current_players=0
    attr_reader :name 
    @@board=Array.new(3) {Array.new(3)}
    def initialize(name)
        @name = name
        @@current_players += 1
    end
    def self.generate_board
        return @@board
    end
    def empty_boxes?
        @@board.any? {|element| element.include?(nil)}
    end
    def self.player_count
        return @@current_players
    end
    def populate_board(player_choice,row_position,column_position)
        @@board[row_position][column_position]=player_choice
        @@board
    end
end

p TicTacToe.generate_board
player1=TicTacToe.new("amaka")
p TicTacToe.player_count
p player1.populate_board('x',0,0)
p player1.empty_boxes?