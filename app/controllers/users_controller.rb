class UsersController < ApplicationController
  # skip_before_action :authenticate_user!

  def index
    if params[:query].present?
      @users = User.search_by_user(params[:query])
        @followings = current_user.following.search_by_user(params[:query])
      @nonfollowings = @users - @followings
    else
      @followings = current_user.following
      @users = User.all
      @nonfollowings = @users - @followings
    end
  end

  def show
    @user = User.find(params[:id])
    @posts = Post.where(user: @user)
    @post_markers = @posts.map do |post|
      {
        lat: post.place.latitude,
        lng: post.place.longitude,
        infoWindow: { content: render_to_string(partial: "places/infowindow", locals: { place: post.place }) }
      }
    end
  end
end
