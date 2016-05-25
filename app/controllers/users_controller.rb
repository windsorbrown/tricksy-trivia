class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @games = Game.where(status: 'pending', keep_private: 0)

    recentscores = UserAnswer.created_between(1.day.ago, Time.now)
    @topscores = recentscores.group(:user).sum(:score)

    wins = Player.where(user: current_user).where(winner: true).count
    losses = Player.where(user: current_user).where.not(winner: true).count
    @win_loss = { wins: wins, losses: losses }
  end

  def create
  end
end
