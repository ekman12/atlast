class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @place = Place.where.not(latitude: nil, longitude: nil)

    @markers = @place.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude
        # infoWindow: { content: render_to_string(partial: "/place/map", locals: { place: place }) }
        # Uncomment the above line if you want each of your markers to display a info window when clicked
        # (you will also need to create the partial "/flats/map_box")
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @user = current_user
    @post_tags = Post.find(params[:id])
  end
end
