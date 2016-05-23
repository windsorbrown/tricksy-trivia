class PlayersController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @players = @game.users
    render json: @players  
  end

  def create
    Player.create!(
      game_id: params[:game_id],
      user: current_user
    )
  end

  def destroy
    Player.find(params[:id]).destroy!
  end

end
