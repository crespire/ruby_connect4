# frozen_string_literal: true

# spec/board_spec.rb

=begin
  Remember, TEST THE INTERFACE.
  Query messages return some value, don't change anything.
  Command messages return nothing, change something.

  Sometimes, a message can have elements of both query and command.

  Key is to remember this spec file tests Connect4. So we only test
  expectations for query messages. ie, Connect4 receives message and
  returns expected result.
=end

require_relative '../lib/connect4'
require_relative '../lib/board'

describe Connect4 do
  describe '#show_rules' do
    subject(:c4_rules) { described_class.new(display: display) }
    let(:display) { double('Display') }

    it 'should send Display the print_rules message' do
      allow(display).to receive(:print_rules)

      expect(display).to receive(:print_rules).once
      c4_rules.show_rules
    end
  end
end