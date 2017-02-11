class HomeController < ApplicationController
  def index
    if current_user
      @projects = Project.where(location: current_user.location)
    else
      render 'unauthenticated'
    end
  end
end
