class NextQuestionJob < ApplicationJob
  queue_as :default

  def perform(game, current_question = nil)
    current_question&.finished!
    game_question = game.next_question
    if game_question
      game_question.active!
    else
      game.finished!
    end
  end
end
