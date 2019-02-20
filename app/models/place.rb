class Place < ApplicationRecord
  has_many :posts
  has_many :wishlist_items
end
