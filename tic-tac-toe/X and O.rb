
class Umpire
    p "Register Player one"
    @@player1=gets.chomp
    p "Register Player two"
    @@player2=gets.chomp
    def initialize (name)
        @name=name
    end
    def player_identity
        player1=gets.chomp
    end
end
umpire=Umpire.new("michael")