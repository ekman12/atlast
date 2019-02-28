class Post < ApplicationRecord
  belongs_to :user
  belongs_to :place
  has_many :post_tags
  has_many :tags, through: :post_tags

  validates :place, presence: true, length: { minimum: 8 }
  validates :user, presence: true
  validates :note, presence: true

  mount_uploader :photo, PhotoUploader
  validates_presence_of :photo, presence: { message: 'must have photo' }

  include PgSearch
  pg_search_scope :search_by_tag_name, associated_against: { tags: :name }
end
