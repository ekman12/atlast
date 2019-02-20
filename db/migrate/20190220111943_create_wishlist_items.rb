class CreateWishlistItems < ActiveRecord::Migration[5.2]
  def change
    create_table :wishlist_items do |t|
      t.references :place, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
