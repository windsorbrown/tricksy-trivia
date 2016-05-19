class PlayersController < ApplicationController

  def index
    @game = Game.find(params[:game_id])
    @players = @game.users
    render json: @players  
  end

end
