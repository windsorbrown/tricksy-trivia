class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @games = Game.where(status: 'pending', keep_private: 0)

    recentscores = UserAnswer.created_between(1.day.ago, Time.now)
    @topscores = recentscores.group(:user).sum(:score)

    done_players = Player.where(user: current_user).joins(:game).where("games.status = 2")
    wins = done_players.where(winner: true).count
    losses = done_players.where(winner: false).count
    @win_loss = { wins: wins, losses: losses }
    @user_has_played = wins - losses
  end

  def create
  end
end
