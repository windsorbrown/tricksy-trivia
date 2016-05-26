class SessionsController < ApplicationController

  def create
  #  
   
    @user = User.find_by(uid: params[:uid]) # temporary user testing. 
    session[:user_id] = @user.id
    redirect_to user_dashboard_url 
  end

  def create_social
    @user = User.create_with_omniauth(request.env['omniauth.auth']) 
    session[:user_id] = @user.id    
    redirect_to user_dashboard_url   #will change to user_path // all working
 
  end



  def destroy
    reset_session
    redirect_to root_url
  end
end
