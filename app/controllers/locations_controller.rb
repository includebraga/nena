class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :show]

  def edit
  end

  def show
  end

  def update
    if @location.update_attributes(location_params)
      redirect_to @location
    end
  end

  private

  def location_params
    params.require(:location).permit(:city, :avatar)
  end

  def set_location
    @location = Location.find(params[:id])
  end
end
