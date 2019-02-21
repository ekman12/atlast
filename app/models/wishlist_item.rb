class WishlistItem < ApplicationRecord
  belongs_to :place
  belongs_to :user
  validates :place, presence: true
  validates :user, presence: true
end
