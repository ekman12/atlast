class Api::V1::PlacesController < ActionController::Base
 def index
 @places = Place.order(created_at: :desc)
 render json: @places
 end
 def show
 @place = Place.find(params[:id])
 render json: @place
 end
 def create
 @place = Place.create(place_params)
 render json: @place
 end
 private
 def place_params
 params.require(:place).permit(:title, :content)
 end
end
