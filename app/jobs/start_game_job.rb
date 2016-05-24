class StartGameJob < ApplicationJob
  queue_as :default

  def perform(game, question_index = 0)
    question = game.questions[question_index]
    ActionCable.server.broadcast "game_#{game.id}",
      { event_type: :next_question, data: question.as_json }

    if question_index + 1 < game.questions.count
      StartGameJob.set(wait: 2.seconds).perform_later(game, question_index + 1)
    else
      game.finished!
    end
  end

end
