class PlacesController < ApplicationController
  # before_action :authenticate_user!

  def index
    redirect_to posts_path if !(params["commit"] == "Search")

    define_tags
    # @places = []
    # @posts = current_user.post_feed
    # @posts.each do |post|
    #   @places << post.place
    # end
    # @places
    @places = current_user.place_feed
    place_search if params[:query].present?

    @searched_tags = []
    Tag.ids.each do |id|
      @searched_tags << id if params[id.to_s].present?
    end
    multiple_tag_search unless @searched_tags.empty?

    @filtered_places = []
    # raise
    @places.each { |p| @filtered_places << p if p.latitude && p.longitude }
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
    @posts = current_user.post_feed.where(place: @place)
    @wishlist = WishlistItem.new
    @wishlist_check = WishlistItem.where(place_id: @place.id, user_id: current_user.id)
  end

  private

  def define_tags
    @tags = Tag.all
    @venue_tags = Tag.where(tag_type: "venue")
    @meal_tags = Tag.where(tag_type: "meal")
    @vibe_tags = Tag.where(tag_type: "vibe")
    @food_tags = Tag.where(tag_type: "food")
    @good_for_tags = Tag.where(tag_type: "good_for")
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
      @places = @tag_results.flatten & current_user.place_feed
    # Behaves weirdly for cafe tag
  end

end

