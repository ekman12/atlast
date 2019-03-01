class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :wishlist_items
  has_many :posts
  has_many :places, through: :posts
  # has_many :places, through: :wishlist_items
  has_many :post_tags, through: :posts
  has_many :tags, through: :post_tags

  # Cloudinary
  mount_uploader :photo, PhotoUploader

  # Follower / Following relationship
  has_many :active_relationships,  class_name:  "UserRelationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "UserRelationship", foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships,  source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  include PgSearch
  pg_search_scope :search_by_user,
                  against: [:username, :first_name, :last_name],
                  using: {
                    tsearch: { prefix: true }
                  }


  before_create :set_default_avatar
  after_create :follow_themselves

  def follow_themselves
    UserRelationship.create(follower: self, followed: self)
  end

  def set_default_avatar
    if self.photo.blank?
      url = "https://www.qualiscare.com/wp-content/uploads/2017/08/default-user.png"
      self.remote_photo_url = url
    end
  end

  # Feeds from followers
  def post_feed
    Post.where("user_id IN (?) OR user_id = ?", following_ids, id)
  end

  def place_feed
    places = []
    post_feed.each do |post|
      places << post.place
    end
    places.uniq
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
