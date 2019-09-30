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
    @current_user = current_user
    @user = User.find(params[:id])
    @posts = Post.where(user: @user)
    # raise
    @post_markers = @posts.map do |post|
      {
        place: post.place,
        infoWindow: { content: render_to_string(partial: "places/infowindow", locals: { place: post.place }) }
      }
    end
  end
end
