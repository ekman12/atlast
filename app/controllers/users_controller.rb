class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  def index
  end

  def show
  end

  def new
  end

  def create
  end
end
