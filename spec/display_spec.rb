# frozen_string_literal: true

# spec/display_spec.rb

require_relative '../lib/connect4'
require_relative '../lib/board'
require_relative '../lib/display'

describe Display do
  describe '#print_board' do
    context "when the board is full" do
      subject(:display) { described_class.new }
      let(:full_board) { Board.new }

      it "displays the full board correctly" do
        6.times do
          7.times do |j|
            full_board.add_chip(j, 'A')
          end
        end

        expected_output = <<~OUTPUT_EXPECTED
        A A A A A A A
        A A A A A A A
        A A A A A A A
        A A A A A A A
        A A A A A A A
        A A A A A A A
        OUTPUT_EXPECTED

        expect(display.print_board(full_board)).to output(expected_output).to_stdout
      end
    end
  end
end