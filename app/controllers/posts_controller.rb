class PostsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    user = current_user
    place_name = post_params[:place]
    place = Place.find_by(name: place_name)
    place = Place.create(name: place_name) if place.nil?
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
  end

  def update
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:photo, :note, :place)
  end

end
