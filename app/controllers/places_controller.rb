class PlacesController < ApplicationController
  # before_action :authenticate_user!

  def index
    @tags = Tag.all
    @places = current_user.place_feed

    place_search if params[:query].present?

    @searched_tags = []
    Tag.ids.each do |id|
      @searched_tags << id if params[id.to_s].present?
    end
    multiple_tag_search unless @searched_tags.empty?

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

  def multiple_tag_search
    # Populate the array with results from the first filter
    @tag_results = Place.search_by_tag_id(@searched_tags.first)
    @searched_tags.each do |id|
      # on the first search there is no change as defined before loop
      # on the second search it gets narrower etc.
      @tag_results = @tag_results & Place.search_by_tag_id(id)
    end
    @places = @tag_results.flatten
    # Behaves weirdly for cafe tag
  end

end
