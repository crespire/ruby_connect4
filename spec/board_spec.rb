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

      it 'returns false on three in a row' do
        winner_game.add_chip(0, 'a')
        winner_game.add_chip(1, 'a')
        winner_game.add_chip(2, 'a')

        # decomposed methods are returning the right thing.
        expect(winner_game.check_col_win).to eq(false)
        expect(winner_game.check_row_win).to eq(false)
        expect(winner_game.check_diag_win).to eq(false)
        expect(winner_game.full?).to eq(false)

        # prediate method seems to return True
        expect(winner_game.gameover?).to eq(false)
      end

      xit 'returns true on stacked row win' do
        # set up a game where the win is on a second row, with the first with 3
      end

      it 'returns true on a column win' do
        4.times { winner_game.add_chip(2, 'a') }
        expect(winner_game).to be_gameover
      end

      xit 'returns true on a / diagonal win' do
      end

      xit 'returns true on a \ diagonal win' do
      end
    end

    context 'when the board is full with no winner' do
      xit 'returns false when there is only one space left' do
      end

      xit 'returns true when the board is full, without a winner' do
      end
    end
  end
end
