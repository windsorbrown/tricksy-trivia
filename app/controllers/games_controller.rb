class GamesController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @game = Game.create(owner: @user)
    @game.players << @user
    @game.questions << Question.limit(5).order("RANDOM()")
    redirect_to @game, layout: 'page'
  end
  
  def index
    render json: Game.all
  end

  def show
    @game = Game.find(params[:id])
    @user = User.find(session[:user_id])
    render layout: 'page'
  end

  def edit
    @user = User.find(session[:user_id])
    @game = Game.find(params[:id])
    @game.players << @user
    redirect_to @game, layout: 'page'
  end

  # def 
  #   @game = Game.find(params[:id])
    
  #   redirect_to @game, layout: 'page'
  # end


  def update
    @game = Game.find(params[:id])
    @user = User.find(session[:user_id])
    @game.players.destroy(@user.id)
    redirect_to @game, layout: 'page'
  end

end
