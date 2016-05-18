class GamesController < ApplicationController

  def show
  end

  def create
    @user = User.find(session[:user_id])
    @game = Game.create(owner: @user)
    render :show, layout: 'page'
  end

  def index
    render json: Game.all
  end

end
