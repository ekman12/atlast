
# **** PLEASE READ ****
# Validations commented out. If you need to add validation you can add it at react level.
# Could potentially add at this level. Look at methods in model.
# Places shown are only the places that the current user follows.

json.array! @places do |place|
  json.extract! place, :id, :name, :address, :latitude, :longitude, :country, :city, :neighbourhood, :google_place_id, :website
  json.posts place.posts do |post|
    # if current_user.following?(post.user)
    json.extract! post, :id, :note
    # end
  end
  json.users place.users do |user|
    json.extract! user, :first_name, :last_name, :username, :picture, :photo
  end
  json.wishlist_items place.wishlist_items do |wishlist_item|
    json.extract! wishlist_item, :id
  end
end

# json.array! @places do |place|
#   json.place do
#     json.name @post.note
#     # json.email_address @message.creator.email_address_with_name
#     # json.url url_for(@message.creator, format: :json)
#   end
# end

# json.extract! @place, :id, :name, :address
# json.posts @place.posts do |post|
#   json.extract! post, :id, :note
# end

# json.array! @places do |place|
#   json.extract! place, :id
#   json.posts @place.posts do |post|
#     json.extract! post, :id
#   end
# end

