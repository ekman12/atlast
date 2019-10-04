require 'json'
require 'open-uri'
class Place < ApplicationRecord
  include PgSearch

  # Associations
  has_many :posts
  has_many :users, through: :posts
  has_many :post_tags, through: :posts
  has_many :tags, through: :post_tags
  has_many :wishlist_items
  # has_many :users, through: :wishlist_items
  has_many :photos, through: :posts
  # belongs_to :post

  #Validations
  # validates :name, presence: true, uniqueness: true

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

  pg_search_scope :search_by_tag_id,
    associated_against: {
      tags: :id
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
  after_create :retrieve_website
  # after_save :save_website


  def retrieve_website
  geocoder_search = Geocoder.search(self.address).first
  if geocoder_search
    self.google_place_id = geocoder_search.data["place_id"]
  end

  url = "https://maps.googleapis.com/maps/api/place/details/json?placeid=#{self.google_place_id}&fields=website&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
  user_serialized = open(url).read
  datas = JSON.parse(user_serialized)
  self.website = datas["result"]["website"] unless datas["result"].nil?
  self.save
  end

end
