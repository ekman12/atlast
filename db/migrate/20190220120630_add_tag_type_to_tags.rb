class AddTagTypeToTags < ActiveRecord::Migration[5.2]
  def change
    add_column :tags, :tag_type, :string
  end
end
