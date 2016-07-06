require_relative 'card'

class Guess
  attr_reader :card,
              :response

  def initialize(response, card)
    @response = response
    @card = card
  end


  def correct?
    if response == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct? == true
      "Correct!"
    else
      "Incorrect."
    end
    # if response == card.answer
    #   'Correct!'
    # else
    #   'Incorrect.'
    # end
  end
end
