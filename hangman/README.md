## Introduction

This is a command line version of the hangman game written in ruby. Writing this program took a couple days but I learnt alot of new things from the error and debugging along the way.

This is my first algorithm that involves serialisation using yaml. Apparently yaml is built into ruby so it came as a handy option. Running rubocop helped clean this project as I'm not yet familiar with the do's and dont's of ruby language.

## Features

The game starts by running the game_start_sequence file in your command line. I tried uploading to a repl environment but a bug issue with the PSYCH class came up which didn't happen on my local machine.

The game is set to be the computer against the human. After running the above file, the gamer is propmted with a dialog to save , start a new game or continue from an old game. This feature is made possible by serialisation in ruby.

## Credit 

Initially I had the idea of converting a hangman gif to a command line animation until i found this hangman text [hangman text](https://gist.github.com/chrishorton/8510732aa9a80a03c829b09f12e20d9c).