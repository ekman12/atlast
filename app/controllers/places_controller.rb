class PlacesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @places = current_user.place_feed
  end

  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @user = current_user
    @post_tags = Post.find(params[:id])
  end
end
