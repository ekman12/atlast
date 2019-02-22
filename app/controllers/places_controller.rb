class PlacesController < ApplicationController
  before_action :authenticate_user!

  def index
    @places = current_user.place_feed
    @filtered_places = []
    @places.each { |p| @filtered_places << p if p.latitude && p.longitude}
    # @filtered_places = @places.where.not(latitude: nil, longitude: nil)
     @markers = @filtered_places.map do |place|
      {
        lat: place.latitude,
        lng: place.longitude,
        infoWindow: { content: render_to_string(partial: "infowindow", locals: { place: place }) }
      }
    end
  end

  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @user = current_user
    # @post_tags = Post.find(params[:id])
    @allposts = Post.where(place: @place)
    @posts = []
    # raise
    @allposts.each do |post|
      @posts.push(post) if current_user.following.include?(post.user)
    end
  end
end

