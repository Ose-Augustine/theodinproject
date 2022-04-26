
class Umpire
    def self.generate_board
        board= Array.new(3) {Array.new(3)}
        board 
    end 
    def self.current_players
        return @@player1 , @@player2
    end
    def winner?
        board=generate_board
        possible_win_1=[0,1,2]
        possible_win_2=[0,0,0]
        possible_win_3=[1,1,1]
        possible_win_4=[2,2,2]
        pattern=[]
        pattern2=[]
        board.each |element| 
            element.each_with_index {|play,index|pattern.push(index) if play=='x'}
        pattern 
    end
end
class Play < Umpire
    @@board=Umpire.generate_board
    def self.empty_boxes?
        @@board.any? {|element| element.include?(nil)}
    end
    def self.populate_board(player_choice,row_position,column_position)
        @@board[row_position][column_position]=player_choice
        @@board
    end
    while Play.empty_boxes? == true
        player_choice=gets.chomp
        row_position=gets.chomp.to_i
        column_position=gets.chomp.to_i
        p Play.populate_board(player_choice,row_position,column_position)
    end
end

umpire=Umpire.new
player=Play.new
# new_group=Umpire.new("james")
# new_group.name
# p Umpire.current_players
# p umpire.populate_board('x',0,0)
