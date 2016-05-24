class GamesController < ApplicationController
  def create
    @game = Game.new(
      owner: current_user, 
      keep_private: params[:game]['keep_private'],
      questions: Question.limit(5).order("RANDOM()")
    )
    @game.players.new(user: current_user)
    @game.save
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    @player = @game.players.find_by(user: current_user)
    render layout: 'page'
  end

  def play
    @game = Game.find(params[:game_id])
    @questions = @game.questions
    render json: @questions
  end

  def play_game
    @game = Game.find(params[:game_id])
    @game.active! if current_user == @game.owner
    redirect_to @game
  end

  def finish
    @game = Game.find(params[:game_id])
    @game.finished!
    redirect_to @game
  end
end
