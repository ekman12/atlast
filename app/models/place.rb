class Place < ApplicationRecord
  include PgSearch

  # Associations
  has_many :posts
  has_many :users, through: :posts
  has_many :post_tags, through: :posts
  has_many :tags, through: :post_tags
  has_many :wishlist_items
  # belongs_to :post

  #Validations
  validates :name, presence: true

  # Search - if you do breakfast it will also search in the post notes
  pg_search_scope :search_by_place,
    against: [:name, :neighbourhood],
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :search_by_tag,
    associated_against: {
      posts: :note,
      tags: :name
    },
    using: {
      tsearch: { prefix: true }
    }

  pg_search_scope :global_search,
    against: [:name, :neighbourhood],
    associated_against: {
      posts: :note,
      tags: :name
    },
    using: {
      tsearch: { prefix: true }
    }


  # Geocoder
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
