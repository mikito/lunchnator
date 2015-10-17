class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.string :address
      t.string :opentime
      t.string :areaname_s
      t.string :image_url_1
      t.string :image_url_2

      t.timestamps null: false
    end
  end
end
