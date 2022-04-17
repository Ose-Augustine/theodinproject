class TicTacToe
    @@current_players=0
    attr_reader :name 
    attr_reader :current_players
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
        board.any? {|element| element.include?(nil)}
    end
    def self.player_count
        return @@current_players
    end
end
class Human < TicTacToe
    def populate_board(play_choice,row_position,column_position)
        board=generate_board
        board[row_position][column_position]=play_choice
        board
    end 
end
