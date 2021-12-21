# frozen_string_literal: true

# lib/display.rb

##
# This class handles the display for the game.
class Display
  ##
  # Initialize method
  def initialize; end

  ##
  # Takes +board+ and renders it in console.
  def board(board)
    row_index = Board::HEIGHT - 1
    board_data = board.get_data
    until row_index.negative?
      col_index = 0
      until col_index > (board_data.length - 1)
        cell = board_data[col_index][row_index]
        print cell.nil? ? '  ' : "#{cell} "
        col_index += 1
      end
      print "\n"
      row_index -= 1
    end
  end

  ##
  # Command method to clear current console display.
  def clear
    system('clear') || system('cls')
  end

  ##
  # Displays the current rules of the game.
  def rules
    puts <<~RULES
      Welcome to Connect4. The goal is to get 4 tokens in a row.
      Like the physical game, you can only stack tokens if there are previous ones below.
      Let's get started!
    RULES
  end

  ##
  # Shows the after-game messaging.
  #
  # +moves+ are the number of moves in the game.
  #
  # +players+ are the current players in the game.
  def after(moves, players)
    winner = players[moves % 2]
    puts "The winner is #{winner.name} playing #{winner.token}!"
  end

  ##
  # Prompt to add a name for a player.
  def player_add(tokens_left)
    num = tokens_left == 2 ? 1 : 2
    print "Player #{num}, what is your name? "
  end

  ##
  # Invalid input message.
  def invalid_input
    puts 'Invalid input, please try again.'
  end

  ##
  # Primary game input method. Displays the board and then prompts the right player for input.
  def game_input(player, board)
    clear
    self.board(board)
    board.length.times do |i|
      print "#{i} "
    end
    print "\n"
    print "#{player.name}, enter a column: "
  end

  ##
  # Prompts for y/n based on the +prompt+ provided.
  def ask_yn(prompt)
    print "#{prompt} (y/n) "
  end
end