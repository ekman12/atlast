class RemoveUserFromPostTags < ActiveRecord::Migration[5.2]
  def change
    remove_reference :post_tags, :user, foreign_key: true
  end
end
