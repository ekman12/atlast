class Tag < ApplicationRecord
  has_many :post_tags
  validates :tag_type, presence: true
  validates :name, presence: true
end
