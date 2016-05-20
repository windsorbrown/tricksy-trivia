class UserAnswersController < ApplicationController
  def create
    @answer = UserAnswer.create(
      user: current_user,
      game: Game.find(params['game_id']),
      answer: params['answer'],
      question: Question.find(params['question_id'])
    )
    render json: @answer
  end
end
