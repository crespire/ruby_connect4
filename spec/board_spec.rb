# frozen_string_literal: true

# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { described_class.new }
    let(:board_var) { board.instance_variable_get(:@board) }
    let(:height) { described_class::HEIGHT }
    let(:win) { described_class::WIN }

    it 'makes a board with 7 columns' do
      expect(board_var.length).to eq(7)
    end

    it 'height is set to 6' do
      expect(height).to eq(6)
    end

    it 'win is set to 4 in a row' do
      expect(win).to eq(4)
    end
  end

  describe '#valid_move?' do
    subject(:board_move) { described_class.new }
    let(:board_var) { board_move.instance_variable_get(:@board) }

    context 'when all columns have 5 chips' do
      it 'returns true given an in-bound column' do
        board_var.each { |column| 5.times { column << 1 } }
        expect(board_move.valid_move?(3)).to be_truthy
      end

      it 'returns nil given an out-of-bounds column' do
        expect(board_move.valid_move?(9)).to be_nil
      end
    end

    context 'when all columns have 6 chips' do
      it 'returns false given an in-bound column' do
        board_var.each { |column| 6.times { column << 1 } }
        expect(board_move.valid_move?(2)).to be_falsey
      end
    end
  end

  describe '#add_chip' do
    subject(:board_add) { described_class.new }

    context 'after input validation' do
      let(:board_var) { board_add.instance_variable_get(:@board) }

      it 'adds a chip to the correct column' do
        board_add.add_chip(4, 1)
        expect(board_var.dig(4, 0)).to eq(1)
      end

      it 'stacks a chip if a column already has a value' do
        board_add.add_chip(2, 1)
        board_add.add_chip(2, 1)
        expect(board_var[2].length).to eq(2)
      end

      it 'returns nil when trying to add to a full column' do
        6.times { board_add.add_chip(2, 1) }
        expect(board_add.add_chip(2, 1)).to be nil
      end
    end
  end

  describe '#gameover?' do
    context 'when there is a winner' do
      subject(:winner_game) { described_class.new }

      it 'returns true on row win' do
        (1..4).to_a.each { |i| winner_game.add_chip(i, 'a') }
        expect(winner_game).to be_gameover
      end

      it 'returns true on a column win' do
        4.times { winner_game.add_chip(2, 'a') }
        expect(winner_game).to be_gameover
      end

      it 'returns true on a / diagonal win' do
        (1..4).to_a.reverse_each do |i|
          (1..i).to_a.reverse_each do |j|
            winner_game.add_chip(i, j == 1 ? 'b' : 'a')
          end
        end
        expect(winner_game).to be_gameover
      end

      it 'returns true on a \ diagonal win' do
        (1..4).to_a.each do |i|
          (1..i).to_a.each do |j|
            winner_game.add_chip(j, i == 1 ? 'b' : 'a')
          end
        end
        expect(winner_game.check_diag_win).to eq(true)
      end
    end

    context 'when the board is full with no winner' do
      subject(:full_game) { described_class.new }

      it 'returns false when there is only one space left' do
        6.times do |i|
          7.times do |j|
            next if i == 5 && j == 6

            full_game.add_chip(j, (65+rand(26)).chr)
          end
        end

        expect(full_game).to_not be_gameover
      end

      it 'returns true when the board is full, without a winner' do
        6.times do |i|
          7.times do |j|
            full_game.add_chip(j, (65+rand(26)).chr)
          end
        end

        expect(full_game).to be_gameover
      end
    end

    context 'edge case for helper #check_col_win' do
      subject(:col_game) { described_class.new }

      it 'returns false in the case of 4 chips in a column, but not adjacent' do
        col_game.add_chip(1, 'a')
        col_game.add_chip(1, 'a')
        col_game.add_chip(1, 'a')
        col_game.add_chip(1, 'c')
        col_game.add_chip(1, 'a')

        expect(col_game.check_col_win).to eq(false)
      end
    end

    context 'edge cases for helper #check_row_win' do
      subject(:row_game) { described_class.new }

      it 'returns true on a row win with non-winning chips below' do
        3.times do |i|
          7.times do |j|
            row_game.add_chip(j, (65+rand(26)).chr)
          end
        end
        4.times { |i| row_game.add_chip(i, 'a') }

        expect(row_game.check_row_win).to eq(true)
      end

      it 'returns false on three in a row' do
        3.times { |i| row_game.add_chip(i, 'a') }
        expect(row_game.check_row_win).to eq(false)
      end

      it 'returns false on three in a row with non-winning chips below' do
        3.times do |i|
          7.times do |j|
            row_game.add_chip(j, (65+rand(26)).chr)
          end
        end
        3.times { |i| row_game.add_chip(i, 'a') }
        expect(row_game.check_row_win).to eq(false)
      end

      it 'returns false in the case of 4 same chips in a row, but not adjacent' do
        3.times do |i|
          7.times do |j|
            row_game.add_chip(j, ((j % 2) + i % 2).to_s)
          end
        end

        row_game.add_chip(1, 'a')
        row_game.add_chip(2, 'a')
        row_game.add_chip(3, 'a')
        row_game.add_chip(4, 'b')
        row_game.add_chip(5, 'a')

        expect(row_game.check_row_win).to eq(false)
      end
    end

    context 'edge cases for helper #check_diag_win' do
      subject(:diag_game) { described_class.new }

      it 'returns false if there are 4 same chips on a / diag, but not adjacent' do
        diag_game.add_chip(0, 'a')

        diag_game.add_chip(1, 'b')
        diag_game.add_chip(1, 'a')

        diag_game.add_chip(2, 'c')
        diag_game.add_chip(2, 'j')
        diag_game.add_chip(2, 'a')

        diag_game.add_chip(3, 'd')
        diag_game.add_chip(3, 'x')
        diag_game.add_chip(3, 'b')
        diag_game.add_chip(3, 'b')

        diag_game.add_chip(4, 'e')
        diag_game.add_chip(4, 'q')
        diag_game.add_chip(4, 'c')
        diag_game.add_chip(4, 'b')
        diag_game.add_chip(4, 'a')

        expect(diag_game.check_diag_win).to eq(false)
      end

      it 'returns false if there are 4 same chips on a \ diag, but not adjacent' do
        diag_game.add_chip(1, 'e')
        diag_game.add_chip(1, 'q')
        diag_game.add_chip(1, 'c')
        diag_game.add_chip(1, 'b')
        diag_game.add_chip(1, 'a')

        diag_game.add_chip(2, 'd')
        diag_game.add_chip(2, 'x')
        diag_game.add_chip(2, 'b')
        diag_game.add_chip(2, 'b')

        diag_game.add_chip(3, 'c')
        diag_game.add_chip(3, 'j')
        diag_game.add_chip(3, 'a')

        diag_game.add_chip(4, 'b')
        diag_game.add_chip(4, 'a')

        diag_game.add_chip(5, 'a')

        expect(diag_game.check_diag_win).to eq(false)
      end
    end
  end
end
