require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/card'

# this test file write tests (make assertions about our code's behavior to see if the code is properly constructed)
# it is a test suite
# .new refers to method initialization or creation of an 'instance' of the related/connected class

class CardTest < Minitest::Test

  def test_it_returns_capital_of_Alaska
    card = Card.new("What is the capital of Alaska?", "Juneau")
    assert_equal "What is the capital of Alaska?", card.question
    assert_equal "Juneau", card.answer
  end

  # testing other questions and answers:
  def test_it_returns_another_question
    card = Card.new("What is the capital of Colorado?", "Denver")
    assert_equal "What is the capital of Colorado?", card.question
    assert_equal "Denver", card.answer
  end

  def test_it_returns_empty_string
    card = Card.new("", "")
    assert_equal "", card.question
    assert_equal "", card.answer
  end
end

##ERROR HELP:
#unitialized constant = can't find a class

# ITERATION 1:
#
# card = Card.new("What is the capital of Alaska?", "Juneau")
# card.question
# => "What is the capital of Alaska?"
# card.answer
# => "Juneau"
