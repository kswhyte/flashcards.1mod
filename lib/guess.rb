require_relative 'card'

class Guess
  attr_reader :response,
              :card

  def initialize(user_response, user_card)
    @response = user_response
    @card = user_card
  end

  def correct?
    if @response == card.answer
      true
    else
      false
    end
  end

  def feedback
    if correct?
      "Correct!"
    else
      "Incorrect."
    end
    # alternative method structure without DRY:
    # if response == card.answer
    #   'Correct!'
    # else
    #   'Incorrect.'
    # end
  end
end
