class PlacesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @places = current_user.place_feed
    place_search if params[:query].present?
    tag_search if params[:tag].present?


    @filtered_places = []
    @places.each { |p| @filtered_places << p if p.latitude && p.longitude}
    @markers = @filtered_places.map do |place|
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
    # @post_tags = Post.find(params[:id])
    @allposts = Post.where(place: @place)
    @posts = []
    # raise
    @allposts.each do |post|
      @posts.push(post) if current_user.following.include?(post.user)
    end
  end

  private

  def place_search
    @matching_places = Place.search_by_place(params[:query])
    @places = @places & @matching_places
  end

  def tag_search
    # raise
    @tagged_places = Place.search_by_tag(params[:tag])
    @places = @places & @tagged_places
  end
end
