class HomeController < ApplicationController
  def index
    if current_user
      @projects = Project.where(location: current_user.location)
      @user     = current_user
    else
      render 'unauthenticated'
    end
  end
end
