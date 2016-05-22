class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = @current_user
    @games = Game.where(status: 'pending', keep_private: 0)
  end

  def create

  end

end
