class UserAnswersController < ApplicationController
  def create
    @game = Game.find(params['game_id'])
    @game_question = @game.questions.find_by(user: current_user)
    @answer = UserAnswer.create(
      game_question: @game_question,
      answer: params['answer'],
      question: Question.find(params['question_id']),
      score: 10
      )
    render json: @answer
  end
end
