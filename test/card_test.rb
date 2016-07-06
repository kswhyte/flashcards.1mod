# write tests (make assertions about our code's behavior)
# test suite

require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/card'

class CardTest < Minitest::Test

  def test_it_returns_capital_of_Alaska
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end
end

#unitialized constant = can't find a class
