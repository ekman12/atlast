class AddPostToPostTags < ActiveRecord::Migration[5.2]
  def change
    add_reference :post_tags, :post, foreign_key: true
  end
end
