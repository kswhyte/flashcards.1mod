require_relative 'deck'
# require_relative 'guess'
# require_relative 'card'
require 'pry'

class Round
  attr_reader :deck,
              :guesses,
              :count

  def initialize(deck)
    @deck = deck
    @guesses = []
  end

  def record_guess(response)
    @guesses << Guess.new(response, current_card)
  end

  def current_card
    deck.cards[@guesses.length]
  end

  def number_correct
    number_correct = @guesses.find_all do |guess|
      guess.correct?
    end
    number_correct.length
  end

  def percent_correct
    number_correct.to_f / deck.cards.length * 100
  end

  def start
    puts "Welcome! You're playing with 4 cards."

    while @guesses.length < deck.cards.length
      puts "This is #{@guesses.length + 1} out of 4."

      puts current_card.question
      user_response = gets.chomp

      record_guess(user_response)
      puts @guesses.last.feedback
    end

    puts "Game over!"
    puts "You had #{number_correct} correct guesses out of 4 for a score of #{percent_correct.to_i} %"
  end

    # Welcome! You're playing with 4 cards.
    # -------------------------------------------------
    # This is card number 1 out of 4.
    # Question: What is 5 + 5?
    # 10
    # Correct!
    # This is card number 2 out of 4.
    # Question: What is Rachel's favorite animal?
    # panda
    # Incorrect.
    # This is card number 3 out of 4.
    # Question: What is Mike's middle name?
    # nobody knows
    # Correct!
    # This is card number 4 out of 4.
    # Question: What cardboard cutout lives at Turing?
    # Justin Bieber
    # Correct!
    # ****** Game over! ******
    # You had 3 correct guesses out of 4 for a score of 75%.

end
