class PlacesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @place = Place.all
  end

  def show
   @place = Place.find(params[:id])
  end
end
