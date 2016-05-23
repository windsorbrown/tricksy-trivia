class UserAnswersController < ApplicationController
  def create
    @answer = UserAnswer.create(
      user: current_user,
      game: Game.find(params['game_id']),
      answer: params['answer'],
      question: Question.find(params['question_id']),
      score: 10
      )
    #check who answered first 
    ActionCable.server.broadcast "game_#{@answer.game.id}",
    question: {question: @answer.question_id, user:current_user, score: @answer.score}
    ActionCable.server.broadcast "overview_channel",
      update_scores: { user: current_user, new_score: @answer.score }
    render json: @answer
  end
end
