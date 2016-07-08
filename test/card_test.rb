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
