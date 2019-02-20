class RemoveTypeFromTags < ActiveRecord::Migration[5.2]
  def change
    remove_column :tags, :type, :string
  end
end
