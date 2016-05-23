class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = @current_user
    @games = Game.where(status: 'pending', keep_private: 0)
    allscores = UserAnswer.created_between(1.day.ago, Time.now)
    @topscores = allscores.group(:user).sum(:score)
  end

  def create

  end

end
