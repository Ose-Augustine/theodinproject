class TicTacToe
    @@current_players=0
    attr_reader :name
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
class Human < TicTacToe
    def populate_board(play_choice,row_position,column_position)
        board=generate_board
        board[row_position][column_position]=play_choice
        p board
    end 
end
player=TicTacToe.new("emeka")
player.generate_board
player.empty_boxes?
p player.name
person=Human.new('james')
person2=Human.new('michael')
person.populate_board('x',0,0)
person2.populate_board('O',0,1)
p person.name