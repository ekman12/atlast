class CreatePlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :places do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :country
      t.string :city
      t.string :neighbourhood
      t.string :address

      t.timestamps
    end
  end
end
