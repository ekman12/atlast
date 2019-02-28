class PostsController < ApplicationController
  def index
    redirect_to places_path if (params["commit"] == "Search")
    @posts = current_user.post_feed
    define_tags
    @places = current_user.place_feed
    place_search if params[:query].present?

    if params[:tags].present?
      @searched_tags = params[:tags].keys
      multiple_tag_search
    end

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
    create_post_tags if params[:tags].present?
    # @tag_ids = Tag.all.ids
    place = Place.find_by(address: params["post"][:place])
    place = create_place(params["post"][:place]) if place.nil?
    @post = Post.new(
      photo: params["post"][:photo],
      note: params["post"][:note],
      place: place,
      user: current_user
    )

    if @post.save
      create_post_tags
      redirect_to places_path
    else
      define_tags
      render :new
    end
  end

  def update
  end

  def destroy
  end

  def create_place(params)
    splited = params.split(",")
    clean_array = splited.collect{|x| x.strip || x }
    name = clean_array[0]
    address = params
    city = clean_array[-2]
    country = clean_array[-1]
    place = Place.new(name: name, address: address, city: city, country: country)
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
    @tag_posts = Post.search_by_tag_name(@searched_tags.first)
    @searched_tags.each do |tagname|
      @tag_posts = @tag_posts & Post.search_by_tag_name(tagname)
    end
    @tag_posts = @tag_posts & current_user.post_feed
    @places = @tag_posts.map(&:place)
  end
  # def post_params
  #   params.require(:post).permit(:photo, :note, :place, :tags)
  # end

  def create_post_tags
    params[:tags].keys.each do |tagname|
      tag = Tag.find_by(name: tagname)
      PostTag.create(tag: tag, post: @post)
    end
    # raise
  end
end
