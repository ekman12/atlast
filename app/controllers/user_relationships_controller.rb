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
    @user_relationship = UserRelationship.find_by(follower_id: current_user.id, followed_id: params[:user_id])
    @user_relationship.destroy
    redirect_to users_path
  end

end
