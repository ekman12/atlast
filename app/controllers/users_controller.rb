class UsersController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @followings = current_user.following
    @users = User.all
    @nonfollowings = @users - @followings
  end

  def show
  end

  def new
  end

  def create
  end
end
