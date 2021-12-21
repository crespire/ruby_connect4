# frozen_string_literal: true

# lib/connect4.rb

require_relative 'board'
require_relative 'player'
require_relative 'display'

##
# Main class that ties all the pieces together.
class Connect4

  ##
  # Initalizes the game with a display
  def initialize(display: Display.new)
    @board = Board.new
    @players = []
    @display = display
    @moves = 0
    @tokens = ['○', '●']
  end

  ##
  # Method to show the rules.
  def show_rules
    @display.rules
  end

  ##
  # Method to show the board
  def show_board
    @display.board(@board)
  end

  ##
  # After round messages
  def show_after
    @display.clear
    @display.board(@board)
    @display.after(@moves, @players)
  end

  ##
  # Prompts to add players
  def prompt_player_add
    return false if @tokens.empty?

    valid = false
    until valid
      @display.player_add(@tokens.length)
      name = gets.chomp
      valid = name.length > 0
      @display.invalid_input unless valid
    end
    add_player(Player.new(name, @tokens.shift))
  end

  ##
  # Helper method to update +@players+ instance variable with +player+
  def add_player(player)
    @players << player
  end

  ##
  # Method to get game input.
  def prompt_game_input
    valid = false
    until valid
      @display.game_input(@players[@moves % 2], @board)
      ans = @players[@moves % 2].game_input
      valid = @board.valid_move?(ans.to_i) if ans.match?(/[[:digit:]]/)
      @display.invalid_input unless valid
    end
    ans.to_i
  end

  ##
  # Method to play one single peice
  def play_round
    input = prompt_game_input
    @board.add_chip(input, @players[@moves % 2].token)
    increment_move unless @board.gameover?
  end

  ##
  # Main gameloop method
  def play
    play_round until @board.gameover?
  end

  ##
  # Method to repeat game?
  def prompt_yn
    valid = false
    until valid
      @display.ask_yn('Would you like to play again?')
      ans = @players[@moves % 2].reply_yn
      valid = ['y','n'].include?(ans)
      @display.invalid_input unless valid
    end
  end

  private

  ##
  # Private helper to increment instance var +@moves+
  def increment_move
    @moves += 1
  end
end
