class SessionsController < ApplicationController
  def create
    if request.env['omniauth.auth']
      user = User.create_with_omniauth(request.env['omniauth.auth'])
      session[:user_id] = user.id    
      redirect_to root_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
