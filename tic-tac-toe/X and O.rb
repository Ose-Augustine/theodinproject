
class Umpire
    def self.generate_board
        board= Array.new(3) {Array.new(3)}
        board 
    end 
    def self.current_players
        return @@player1 , @@player2
    end
    def self.empty_boxes?(board)
        board.any? {|element| element.include?(nil)}
    end
    def self.winner?(board)
        vertical_1=[0,3,6]
        vertical_2=[1,4,7]
        vertical_3=[2,5,8]
        diagonal_1=[0,4,8]
        diagonal_2=[2,4,6]
        horizontal_1=[0,1,2]
        horizontal_2=[3,4,5]
        horizontal_3=[6,7,8]
        win_board=[vertical_1,vertical_2,vertical_3,diagonal_1,diagonal_2,horizontal_1,horizontal_2,horizontal_3]
        accumulator=''
        win_combination=[]
        win_combination2=[]
        board.each {|nested| accumulator += nested.join}
        accumulator.length.times {|index| win_combination << index if accumulator[index,1]=='x'}
        accumulator.length.times {|index| win_combination2 << index if accumulator[index,1]=='o' }
        if win_board.any? {|element| element==win_combination}
            return "Player one wins "
        end
        if win_board.any? {|element| element==win_combination2}
            return "Player two wins "
        end
    end
end
class Play < Umpire
    @@board=Umpire.generate_board
   
    def self.populate_board(player_choice,row_position,column_position)
        @@board[row_position][column_position]=player_choice
        @@board
    end
    i=0
    while Umpire.empty_boxes?(@@board) == true
        5.times do
            player_choice=gets.chomp
            row_position=gets.chomp.to_i
            column_position=gets.chomp.to_i
            p Play.populate_board(player_choice,row_position,column_position)
            unless Umpire.winner?(@@board)==nil
              p Umpire.winner?(@@board)
              @@board=generate_board
            end
        end
    end
end

umpire=Umpire.new
player=Play.new
# new_group=Umpire.new("james")
# new_group.name
# p Umpire.current_players
# p umpire.populate_board('x',0,0)
