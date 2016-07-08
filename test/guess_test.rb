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
    # or assert_equal true, guess.response

    # testing incorrect guess:
    guess = Guess.new("Jerusalem", card)
    assert_equal "Jerusalem", guess.response
    refute guess.correct?
  end

  def test_it_checks_if_card_answer_matches_another_response
    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Saturn", guess.response
    refute guess.correct?
    # or assert_equal false, guess.response

    # testing correct guess:
    # assert_equal "Mercury", guess.response
  end

  def test_it_gives_feedback_whether_guess_is_correct_or_not
    card = Card.new("What is the capital of Alaska?", "Juneau")
    guess = Guess.new("Juneau", card)

    assert_equal "Correct!", guess.feedback

    card = Card.new("Which planet is closest to the sun?", "Mercury")
    guess = Guess.new("Saturn", card)

    assert_equal "Incorrect.", guess.feedback
  end
    # assert_equal "Incorrect.", guess.feedback
end

# ITERATION 2:
# card = Card.new("What is the capital of Alaska?", "Juneau")
# guess = Guess.new("Juneau", card)
# guess.card
# => #<Card:0x007ffdf1820a90 @answer="Juneau", @question="What is the capital of Alaska?">
# guess.response
# => "Juneau"
# guess.correct?
# => true
# guess.feedback
# => "Correct!"
# card = Card.new("Which planet is closest to the sun?", "Mercury")
# guess = Guess.new("Saturn", card)
# guess.card
# => #<Card:0x007ffdf1820a90 @answer="Mercury", @question="Which planet is closest to the sun?">
# guess.response
# => "Saturn"
# guess.correct?
# => false
# guess.feedback
# => "Incorrect."
