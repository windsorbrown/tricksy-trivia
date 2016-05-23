class GamesController < ApplicationController
  def create
    @owner = User.find(session[:user_id])
    @game = Game.create(owner: @owner, keep_private: params[:game]['keep_private'])
    @game.questions << Question.limit(5).order("RANDOM()")
    ActionCable.server.broadcast "overview_channel",
      open_game: {game: @game, owner: @owner}
    redirect_to @game, layout: 'page'
  end

  def show
    @game = Game.find(params[:id])
    @player = @game.players.find_by(user: current_user)
    render layout: 'page'
  end

  def edit
    @game = Game.find(params[:id])
    @user = current_user
    @game.add_player(@user)
    redirect_to @game, layout: 'page'
  end

  def update
    @game = Game.find(params[:id])
    @user = current_user
    @game.players.find_by(user: @user).destroy
    redirect_to @game, layout: 'page'
  end

  def play
    @game = Game.find(params[:id])
    @questions = @game.questions
    render json: @questions
  end

  def play_game
    @game = Game.find(params[:id])
    @user = current_user
    @player = Player.find_by(user: @user, game: @game)

    @game.active!
    ActionCable.server.broadcast "room_#{@game.id}",
      game_start: {game: @game, status:@game.status}
    ActionCable.server.broadcast "overview_channel",
      close_game: {game: @game}

    render layout: 'page'
  end

  def finish
    @game = Game.find(params[:id])
    @game.finished!
    Player.find_by(user: current_user, game: @game).update(winner: true)
    render json: @game.status
  end
end
