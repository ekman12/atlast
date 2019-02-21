class PostsController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def destroy
  end
end
