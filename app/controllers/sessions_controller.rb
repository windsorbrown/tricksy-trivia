class SessionsController < ApplicationController

  def create
    @user = User.create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id    
    #redirect_to root_url  ## needs to be change to user_path(user.id)
    render json: @user
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end
