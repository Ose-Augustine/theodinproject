# INTRODUCTION

This is a rendition of the markdown game. Different features have been coded into the game for instances where the human or the computer is to be the code breaker or the human or computer is to be the code maker.

The game does not keep tabs of the scores per round so players should do that the themselves following the generally known rules.

# HUMAN CODEBREAKER

 If the human is to be the code breaker, then the code maker class will be called with no instance variable. 
 
 To make the game more interactive to the human, there is already a predefined board of five colours from which the human is to guess four to use in game play. The game starts when the play game method is called by the code breaker.
 
 The computer will prompt for the play to choose a certain colour combination for each round. For each colour choice, the computer will give a feed back of the number of red and white pegs obtained following a scan of the computer's own choice of colours that will remain unknown to the player.

# COMPUTER CODEBREAKER

  If the computer is to be the code breaker, the code breaker class will have no instance variable. In order for the game to be interactive for the computer, a different algorithm of check and feedback will be used.

The computer will prompt the user to put in their desired code. This code will be a four digit number within the range 1111..6666. For each guess the computer makes, the human will be prompted to give a feedback.

This feedback will be worked on by the computer to make the next guess. The algorithm for guessing is based on the Swaszek strategy.
