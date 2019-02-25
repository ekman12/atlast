class PostsController < ApplicationController
  # skip_before_action :authenticate_user!
  def index
     @posts = current_user.post_feed
  end

  def show
  end

  def new
    # raise
    @post = Post.new
    @venue_tags = Tag.where(tag_type: "venue")
    @meal_tags = Tag.where(tag_type: "meal")
    @vibe_tags = Tag.where(tag_type: "vibe")
    @food_tags = Tag.where(tag_type: "food")
    @good_for_tags = Tag.where(tag_type: "good_for")
  end

  def create
    # raise
    @tag_ids = Tag.all.ids
    # raise
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
    city = clean_array[-2]
    country = clean_array[-1]
    place = Place.create(name: name, address: address, city: city, country: country)
  end

  private



  # def post_params
  #   params.require(:post).permit(:photo, :note, :place, :tags)
  # end

  def create_post_tags
    @tag_ids = @tag_ids - [""]
    @post_tags = []
    # raise
    @tag_ids.each do |tag|
      PostTag.create(tag_id: tag.to_i, post: @post) unless params[@tag_ids.first.to_s].nil?
    end
  end
end
