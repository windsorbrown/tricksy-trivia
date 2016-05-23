class PlayersController < ApplicationController
  def create
    @game = Game.find params[:game_id]
    Player.create!(
      game: @game,
      user: current_user
    )
    redirect_to @game if @game
  end

  def destroy
    @game = Game.find params[:game_id] if params[:game_id]
    Player.find(params[:id]).destroy!
    redirect_to @game if @game
  end

end
