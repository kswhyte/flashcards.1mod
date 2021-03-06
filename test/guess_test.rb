require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/guess'
require 'pry'

class GuessTest < Minitest::Test
  def test_it_checks_if_card_answer_matches_first_response
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert card, guess.card
    assert_equal "Juneau", guess.response
    assert guess.correct?
    
    guess = Guess.new("Jerusalem", card)
    assert_equal "Jerusalem", guess.response
    refute guess.correct?
  end

  def test_it_checks_if_card_answer_matches_another_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Saturn", guess.response
    refute guess.correct?
  end

  def test_it_checks_whether_guess_is_correct_or_not
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback

    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect.", guess.feedback
  end
    # assert_equal "Incorrect.", guess.feedback
end
