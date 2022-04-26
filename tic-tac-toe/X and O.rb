
class Umpire
    p "Register Player one"
    @@player1, choice1=gets.chomp , gets.chomp#get both the player name and what the player prefers to use
    p"Register Player two"
    @@player2, choice2=gets.chomp , gets.chomp
    def initialize (name)
        @name=name
    end
    def generate_board
        board= Array.new(3) {Array.new(3)}
        p board 
    end 
    def populate_board(player_choice,row_position,column_position)
        board=generate_board
        board[row_position][column_position]=player_choice
        board
    end
    def self.current_players
        return @@player1 , @@player2
    end
end
umpire=Umpire.new("michael")
umpire.generate_board
p Umpire.current_players
p umpire.populate_board('x',0,0)
