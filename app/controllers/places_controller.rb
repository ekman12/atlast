class PlacesController < ApplicationController
  # before_action :authenticate_user!

  def index
    define_tags
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
    @allposts = Post.where(place: @place)
    @posts = []
    @allposts.each do |post|
      @posts.push(post) if current_user.following.include?(post.user)
    end
  end

  private

  def define_tags
    @tags = Tag.all
    @venue_tags = Tag.where(tag_type: "venue")
    @meal_tags = Tag.where(tag_type: "meal")
    @vibe_tags = Tag.where(tag_type: "vibe")
    @food_tags = Tag.where(tag_type: "food")
  end


  def place_search
    @matching_places = Place.search_by_place(params[:query])
    @places = @places & @matching_places
  end

  def multiple_tag_search
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
