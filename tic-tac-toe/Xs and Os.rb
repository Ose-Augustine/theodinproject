# frozen_string_literal: true

class TicTacToe
  @@current_players = 0
  attr_reader :name

  @@board = Array.new(3) { Array.new(3) }
  def initialize(name)
    @name = name
    @@current_players += 1
  end

  def self.request_player_identity
    player1 = gets.chomp
    player2 = gets.chomp
  end

  def self.start_game
    p 'Welcome, shall we begin?'
    board = generate_board
    p "The board for this game #{board}"
    p 'Registrations please'
    request_player_identity
  end

  def self.generate_board
    @@board
  end

  def empty_boxes?
    @@board.any? { |element| element.include?(nil) }
  end

  def self.player_count
    @@current_players
  end

  def populate_board(player_choice, row_position, column_position)
    @@board[row_position][column_position] = player_choice
    @@board
  end
end

# p TicTacToe.generate_board
# player1=TicTacToe.new("amaka")
player2 = TicTacToe.new('james')
# p TicTacToe.player_count
# p player1.populate_board('x',0,0)
p player2.populate_board('o', 0, 1)
# p player1.empty_boxes?
TicTacToe.start_game
TicTacToe.request_player_identity
