class StartGameJob < ApplicationJob
  queue_as :default

  def perform(game)
    question = game.question_generator.next
    ActionCable.server.broadcast "game_#{game.id}",
      {event_type: :next_question, data: question.as_json }

    StartGameJob.set(wait: 2.seconds).perform_later(game)
  end

end
