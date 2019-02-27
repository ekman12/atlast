class AddWebsiteToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_column :places, :website, :string
  end
end
