class PlacesController < ApplicationController
  def index
    define_tags
    @places = current_user.place_feed
    place_search if params[:query].present?

    if params[:tags].present?
      @searched_tags = params[:tags].keys
      multiple_tag_search
    end

    @filtered_places = []
    @places.each { |p| @filtered_places << p if p.latitude && p.longitude }
    @markers = @filtered_places.map do |place|
      {
        place: place,
        infoWindow: { content: render_to_string(partial: "infowindow", locals: { place: place }) }
      }
    end
    # raise
  end

  def show
    @place = Place.find(params[:id])
    @posts = current_user.post_feed.where(place: @place)
    @wishlist = WishlistItem.new
    @wishlist_check = WishlistItem.where(place_id: @place.id, user_id: current_user.id)
    tag_collection_new
    @place_markers = [{ place: @place }]
  end

  private

  def tag_collection_new
    @tag_collection = {}
    current_user.post_feed.where(place: @place).each do |post|
      post.tags.each do |tag|
        if @tag_collection[tag.name]
          @tag_collection[tag.name] += 1
        else
          @tag_collection[tag.name] = 1
        end
      end
    end
    @tag_collection = @tag_collection.sort_by {|k, v| v}.reverse
  end


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
    @places = @places.uniq
  end

  def multiple_tag_search
    @tag_posts = Post.search_by_tag_name(@searched_tags.first)
    @searched_tags.each do |tagname|
      @tag_posts = @tag_posts & Post.search_by_tag_name(tagname)
    end
    @tag_posts = @tag_posts & current_user.post_feed
    @places = @tag_posts.map(&:place)
    @places = @places.uniq
  end
end
