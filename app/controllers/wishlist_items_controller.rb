class WishlistItemsController < ApplicationController
  def index
    @wishlists = current_user.wishlist_items
    raise
  end

  def new
    @wishlist = WishlistItem.new
    raise
  end

  def create
    raise
    @place = Place.find(params[:place_id])
  end
end
