class CreatePostTags < ActiveRecord::Migration[5.2]
  def change
    create_table :post_tags do |t|
      t.references :user, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
