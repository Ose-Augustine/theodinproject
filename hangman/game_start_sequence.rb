p"Start new or continue from new game."
p%{To start new game press 1. To continue old game, press 2
    1.New game
    2.Saved progress.
}
choice = gets.chomp

def new_game_sequence(choice)
    p"Your name :"
    player = gets.chomp
    controller = HangmanControls.new
    gamer      = Gamer.new("#{player}")
    controller.start_game
end