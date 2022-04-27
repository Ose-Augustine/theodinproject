
class Umpire
    def initialize(name)
        @name=name
    end
    def generate_board
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
        board.each {|nested| accumulator += nested.join}
        accumulator.length.times {|index| win_combination << index if accumulator[index,1]=='x'}
        win_board.any? {|element| element==win_combination}

    end
end
class Play < Umpire
    board=generate_board
   
    def self.populate_board(player_choice,row_position,column_position)
        @@board[row_position][column_position]=player_choice
        @@board
    end
    while Umpire.empty_boxes?(@@board) == true
        player_choice=gets.chomp
        row_position=gets.chomp.to_i
        column_position=gets.chomp.to_i
        p Play.populate_board(player_choice,row_position,column_position)
        if Umpire.winner?(@@board)==true then 
            p "Player one wins "
            break
        end
    end
end

umpire=Umpire.new('james')
player=Play.new('amka')
# new_group=Umpire.new("james")
# new_group.name
# p Umpire.current_players
# p umpire.populate_board('x',0,0)
