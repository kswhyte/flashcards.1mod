require './lib/round'

card_1 = Card.new("What is the largest planet in the solar system?", "Jupiter")
card_2 = Card.new("What is the second most distant planet in the solar system?", "Neptune")
card_3 = Card.new("What is the shape that is formed by the path of movement of our solar system?", "helix")
card_4 = Card.new("What are the largest mountains in the United States?", "Rockies")
card_5 = Card.new("What is a plant that koalas eat in Australia that acts as a sedative?", "Eucalyptus")

deck = Deck.new([card_1, card_2, card_3, card_4])

round = Round.new(deck)

round.start
