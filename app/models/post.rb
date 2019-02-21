class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :post_tags
  has_many :tags, through: :post_tags
  validates :place, presence: true
  validates :user, presence: true
end
