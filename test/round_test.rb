require "minitest"
require "minitest/autorun"
require "minitest/pride"
require 'pry'
require_relative '../lib/round'

class RoundTest < Minitest::Test

  def test_it_processes_responses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal deck, round.deck
  end

  def test_it_records_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal [], round.guesses
  end

  def test_it_determines_current_card
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    current_card = round.current_card
    assert_equal card_1, round.current_card

    round.record_guess("15")
    assert_equal card_2, round.current_card
  end

  def test_it_records_one_guess_into_array
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_instance_of Guess, round.guesses.last
    assert_equal "Juneau", round.guesses.last.response

    round.record_guess("93,000,000")
    assert_instance_of Guess, round.guesses.last
    assert_equal "93,000,000", round.guesses.last.response
  end


  def test_it_counts_guesses
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal 1, round.guesses.count
    end

  def test_it_logs_feedback_as_correct_or_not

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.record_guess("Juneau")
    # binding.pry

    assert_equal "Correct!", round.guesses.first.feedback
  end

  def test_it_counts_number_of_correct_guesses

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.record_guess("Juneau")
    assert_equal 1, round.number_correct

    round.record_guess("93,000,000")
    assert_equal 2, round.number_correct
  end

  # def test_
end

# round.current_card
# => #<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">

# round.record_guess("2")
# => #<Guess:0x007ffdf19c8a00 @card=#<Card:0x007ffdf1820a90 @answer="93,000,000", @question="Approximately how many miles are in one astronomical unit?">, @response="2">
#
# round.guesses.count
# => 2
#
# round.guesses.last.feedback
# => "Incorrect."
#
# round.number_correct
# => 1
#
# round.percent_correct
# => 50


# card_1.question => "what is life?"
# # if it were attr_accessor
# card_1.question = "another question"
# card_1.question => "another question"



# assert_equal "Approximately how many miles are in one astronomical unit?", round.guesses.last.card.question

# def test_it_records_multiple_guesses_into_an_array
#   card_1 = Card.new("What is the capital of Alaska?", "Juneau")
#   card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")
#
#   deck = Deck.new([card_1, card_2])
#
#   round = Round.new(deck)
#
#   round.record_guess("Juneau")
#   round.record_guess("93,000,000")
#
#   # require "pry"; binding.pry
#   # assert_equal ["Juneau", "93,000,000"], round.guesses
#   # assert_equal "Juneau", round.guesses.last.ans
#   # round.record_guess("93,000,000")
#   # assert_equal ["Juneau", "93,000,000"], round.guesses
#   # refute_equal ["Juneau"], round.guesses
# end
