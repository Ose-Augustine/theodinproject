require_relative 'main.rb'
p"choose to play as code breaker or code maker. To play as code maker just type in CodeMaker and press enter.
Same applies for CodeBreaker."
choice=gets.chomp
unless choice=='Codebreaker' || choice=='CodeMaker'
    p"Please input a valid game mode."
    choice=gets.chomp
end
if choice=='CodeBreaker'
    p"This is a rendition of the mastermind game. To make it interactive for the humann player, you can choose from \n
    a set of colours i,e ['red','orange','white','purple','yellow']. Choose any four of those to make up your guess
    and receive a feed back from the computer."
    p"The computer will propmt you for a position on the board to place your current guess combination."
    p"After choosing a colour, press enter to choose another one."
else
    p"This is a rendition of the mastermind game. To make it interactive for the computer, the human code maker should input a code of four digits within the range of 1111...6666 for the computer to guess."
    p"After each guess, the computer will ask the human for a feedback of how many red and white pegs it got for
    the guess."
    p"The computer uses this information to make the next guess intelligently."
    p"Note the computer has no access the what the human guess was. So if the computer guesses all digits correctly
    , a feed back of 4 red pegs would end the game with the computer as winnner."
end

def game_mode(choice)
    if choice=='CodeMaker'
        p'What is your name?'
        name=gets.chomp
        player=CodeMaker.new(name)
        player2=CodeBreaker.new
        player2.start_game
    else
        p"Computer's code is made, start your guess and wait for feedback"
        player=CodeBreaker.new
        player2=CodeMaker.new('james')
        player2.start_game
    end
end
game_mode(choice)