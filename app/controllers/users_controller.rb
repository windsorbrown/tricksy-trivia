class UsersController < ApplicationController
  before_filter :restrict_access

  def show
    @user = @current_user
  end

  def create

  end

end
