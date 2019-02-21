class PlacesController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @place = Place.all
  end

  def show
    @place = Place.find(params[:id])
    @post = Post.new
    @user = current_user
    @post_tags = Post.find(params[:id])
  end
end
