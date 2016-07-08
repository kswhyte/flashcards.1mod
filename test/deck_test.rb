require "minitest"
require "minitest/autorun"
require "minitest/pride"
require_relative '../lib/deck'
require 'pry'

class DeckTest < Minitest::Test
  def test_if_card_is_created_with_correct_content

    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")

    deck = Deck.new([card_1, card_2, card_3])

    assert_equal [card_1, card_2, card_3], deck.cards
  end

  def test_it_checks_number_of_cards_inside_deck
    card_1 = Card.new("What is the capital of Alaska?", "Juneau")
    card_2 = Card.new("The Viking spacecraft sent back to Earth photographs and reports about the surface of which planet?", "Mars")
    card_3 = Card.new("Describe in words the exact direction that is 697.5° clockwise from due north?", "North north west")

    deck = Deck.new([card_1, card_2, card_3])

    assert_equal 3, deck.count
  end
end
