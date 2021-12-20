# frozen_string_literal: true

# lib/display.rb

class Display
  def initialize
    @display_index = 0
  end

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

  def rules
    puts <<~RULES
    Welcome to Connect4. The goal is to get 4 tokens in a row.
    Like the physical game, you can only stack tokens if there are previous ones.
    The first to four wins!
    RULES
  end

  def after(board, players)
    winner = board.last_move
    name = players.select { |player| return player.name if player.token == winner}
    puts "The winner is #{name}!"
  end

  def player_add
    print "What is your name? "
  end

  def invalid_input
    puts 'Invalid move, please enter another.'
  end

  def game_input(player, board)
    system('clear') || system('cls')
    self.board
    board.length.times do |i|
      print "#{i} "
    end
    print "\n"
    print "#{player.name}, enter a column: "
  end

  def ask_yn(prompt)
    print "#{prompt} (y/n) "
  end
end