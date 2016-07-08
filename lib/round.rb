require_relative 'deck'
require 'pry'

class Round
  attr_reader :deck,
              :guesses,
              :current_card,
              :count



  def initialize(deck)
    @deck = deck
    @guesses = []
    @current_card = deck.cards[0]
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
    rotate_deck
  end

  def rotate_deck
    deck.cards.rotate!
    @current_card = deck.cards[0]
  end

  def number_correct
    number_correct = guesses.count
  end

  
  # def feedback
  #   @feedback = feedback
  # end

end
