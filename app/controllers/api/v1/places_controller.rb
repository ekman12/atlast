class Api::V1::PlacesController < ActionController::Base

  def index
    # @places = Place.order(created_at: :desc)
    # render json: @places
    @places = current_user.place_feed
    @this_user = [current_user]
  end

  # def show
  #   @place = Place.find(params[:id])
  #   render json: @place
  # end

  # def create
  #   @place = Place.create(place_params)
  #   render json: @place
  # end

  private

  # def place_params
  #   params.require(:place).permit(:title, :content)
  # end
end

  # before_action :set_restaurant, only: [ :show ]

  # def show
  # end

  # private

  # def set_restaurant
  #   @restaurant = Restaurant.find(params[:id])
  #   authorize @restaurant  # For Pundit
  # end
