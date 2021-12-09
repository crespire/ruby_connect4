# frozen_string_literal: true

# spec/board_spec.rb

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:board) { described_class.new }
    let(:board_var) { board.instance_variable_get(:@board) }
    let(:height) { described_class::HEIGHT }

    it 'makes a board with 7 columns' do
      expect(board_var.length).to eq(7)
    end

    it 'height is set to 6' do
      expect(height).to eq(6)
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
end
