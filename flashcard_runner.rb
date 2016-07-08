require_relative 'round'

card_1 = Card.new("question", "answer")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start
