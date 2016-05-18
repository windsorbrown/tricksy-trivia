class GamesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @game = Game.create(owner: @user)
  end
  
  def index
    render json: Game.all
  end
end
