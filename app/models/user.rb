class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wishlist_items
  has_many :posts
  has_many :places, through: :posts

  # Follower / Following relationship
  has_many :active_relationships,  class_name:  "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "UserRelationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  # Feeds from followers
  def post_feed
    Post.where("user_id IN (?) OR user_id = ?", following_ids, id)
  end

  def place_feed
    places = []
    post_feed.each do |post|
      places << post.place
    end
    places
  end

  # Follow methods
  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end

end
