class UserRelationshipsController < ApplicationController
  def new
    user_relationship = UserRelationship.new()
  end

  def create
    @user_relationship = UserRelationship.new(
      followed: User.find(params[:user_id]) || User.find(params[:user_id]),
      follower: current_user
      )
    if @user_relationship.save
      redirect_to user_path(User.find(params[:user_id]))
    else
      render :new
    end
  end

  def destroy
  end
end
