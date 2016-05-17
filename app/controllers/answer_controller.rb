class AnswerController < ApplicationController
 skip_before_action :verify_authenticity_token
  def update
    answer = Question.find(params['id']).answer
    guess = params['answer']
    render json: {correct: guess.downcase.delete(' ') == answer.downcase.delete(' ')}
  end
end
