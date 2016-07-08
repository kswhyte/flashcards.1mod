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

    assert_equal card_1, round.current_card
    round.record_guess("Juneau")

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

    round.record_guess("93,000,000")
    assert_equal 2, round.guesses.count

    round.record_guess("50")
    assert_equal 3, round.guesses.count
  end

  def test_it_logs_guess_as_correct_or_not
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    assert_equal card_1, deck.cards.first
    round.record_guess("Juneau")
    assert_equal "Correct!", round.guesses.first.feedback

    round.record_guess("9")
    assert_equal "Incorrect.", round.guesses.last.feedback
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

  def test_it_calculates_correct_guesses_by_percent
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("Approximately how many miles are in one astronomical unit?", "93,000,000")

    deck = Deck.new([card_1, card_2])

    round = Round.new(deck)

    round.record_guess("Juneau")
    round.record_guess("11")

    assert_equal 50, round.percent_correct
  end
end
