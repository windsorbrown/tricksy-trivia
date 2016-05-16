class SessionsController < ApplicationController

  def create
    @user = User.create_with_omniauth(request.env['omniauth.auth'])
    session[:user_id] = @user.id    
    redirect_to user_dashboard_url   #will change to profile or something
    #render json: @user
  end

  def destroy
    reset_session
    redirect_to root_url
  end
end
