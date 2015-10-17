class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :gid, null: false
      t.string :name, null: false
      t.string :url, null: false
      t.float :latitude
      t.float :longitude
      t.string :address, null: false
      t.string :opentime
      t.string :areaname_s, null: false
      t.string :image_url_1
      t.string :image_url_2
    end
  end
end
