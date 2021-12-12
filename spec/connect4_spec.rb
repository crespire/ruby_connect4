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
  describe '#initialize' do
  end
end