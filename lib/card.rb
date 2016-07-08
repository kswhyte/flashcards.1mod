class Card
  attr_reader :question,
              :answer

  def initialize(user_question, user_answer)
    @question = user_question
    @answer = user_answer
  end
end

# @question - instance variable that stores that data(user_question)

# :question - method that accesses @question (instance variable)


# attr_writer - non-shortcut version:
# def question = (data)
#   @question = data
# end


  # def question
  #   @question
  # end
  #
  # def answer
  #   @answer
  # end

  # ^^these methods are defined as the shortcut attr_reader :variable and can be used/called as methods
