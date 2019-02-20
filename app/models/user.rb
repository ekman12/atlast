class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts
  has_many :places, through: :posts
  # Not to sure about these things copied from the book prima gave.
  has_many :user_relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :following, through: :user_relationships, source: :followed
  has_many :wishlist_items
end
