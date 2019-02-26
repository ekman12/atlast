class PostsController < ApplicationController
  def index
    redirect_to places_path if (params["commit"] == "Search")
    @posts = current_user.post_feed
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
  end

  def new
    @post = Post.new
    @venue_tags = Tag.where(tag_type: "venue")
    @meal_tags = Tag.where(tag_type: "meal")
    @vibe_tags = Tag.where(tag_type: "vibe")
    @food_tags = Tag.where(tag_type: "food")
    @good_for_tags = Tag.where(tag_type: "good_for")
  end

  def create
    @tag_ids = Tag.all.ids
    place = Place.find_by(address: params["post"][:place])
    place = create_place(params["post"][:place]) if place.nil?
    @post = Post.new(
      photo: params["post"][:photo],
      note: params["post"][:note],
      place: place,
      user: current_user
    )
    if @post.save
      redirect_to places_path
    else
      render :new
    end
    create_post_tags
  end

  def update
  end

  def destroy
  end

  def create_place(params)
    splited = params.split(",")
    clean_array = splited.collect{|x| x.strip || x }
    name = clean_array[0]
    # address = clean_array[1]
    address = params
    google_place_id = Geocoder.search(params).first.data["place_id"]
    city = clean_array[-2]
    country = clean_array[-1]
    place = Place.new(name: name, address: address, city: city, country: country, google_place_id: google_place_id)
    place.save
    return place
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

  # def post_params
  #   params.require(:post).permit(:photo, :note, :place, :tags)
  # end

  def create_post_tags
    @tag_ids = @tag_ids - [""]
    @post_tags = []
    # raise
    @tag_ids.each do |tag|
      PostTag.create(tag_id: tag.to_i, post: @post) unless params[tag.to_s].nil?
    end
  end
end
