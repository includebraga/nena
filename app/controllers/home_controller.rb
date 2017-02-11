class HomeController < ApplicationController
  def index
    render 'unauthenticated' if current_user.nil?
  end
end
