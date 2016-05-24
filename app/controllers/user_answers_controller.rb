class UserAnswersController < ApplicationController
  def create
    @game = Game.find(params['game_id'])
    @game_question = @game.game_questions.find_by(question_id: params['question_id'])
    @answer = UserAnswer.create!(
      user: current_user,
      game_question: @game_question,
      answer: params['answer'],
      question: Question.find(params['question_id']),
      score: 10
      )
    render json: @answer
  end
end
