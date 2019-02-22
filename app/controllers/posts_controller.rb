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
  end

  def create
    @tag_ids = params[:post][:tag_ids]
    place = Place.find_by(name: post_params[:place])
    place = Place.create(name: post_params[:place]) if place.nil?
    @post = Post.new(
      photo: post_params[:photo],
      note: post_params[:note],
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

  private

  def post_params
    params.require(:post).permit(:photo, :note, :place, :tags)
  end

  def create_post_tags
    @tag_ids = @tag_ids - [""]
    @post_tags = []
    @tag_ids.each do |tag|
      PostTag.create(tag_id: tag.to_i, post: @post)
    end
  end
end
