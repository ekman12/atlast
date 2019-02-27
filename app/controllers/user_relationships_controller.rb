class UserRelationshipsController < ApplicationController
  def new
    user_relationship = UserRelationship.new()
  end

  def create
    @followed = User.find(params[:user_id])
    @user_relationship = UserRelationship.new(
      followed: @followed,
      follower: current_user
      )
    if @user_relationship.save
      respond_to do |format|
        #raise
        format.html { redirect_to user_path(User.find(params[:user_id])) }
        format.js # <-- will render `app/views/reviews/create.js.erb`
      end
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
