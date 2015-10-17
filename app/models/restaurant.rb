# == Schema Information
#
# Table name: restaurants
#
#  id              :integer          not null, primary key
#  gid             :string(255)      not null
#  name            :string(255)      not null
#  url             :string(255)      not null
#  latitude        :float(24)
#  longitude       :float(24)
#  address         :string(255)      not null
#  opentime        :string(255)
#  areaname_s      :string(255)      not null
#  category_name_l :string(255)      not null
#  image_url_1     :string(255)
#  image_url_2     :string(255)
#

class Restaurant < ActiveRecord::Base
  scope :around, ->(longitude, latitude) {
    long_to_m = 3000.0/111136.0
    lati_to_m = 3000.0/111325.0
    long_range = (longitude - long_to_m)..(longitude + long_to_m)
    lati_range = (latitude - lati_to_m)..(latitude + lati_to_m)
    where(longitude: long_range, latitude: lati_range)
  }

  def self.build_from_api(json)
    image_urls = json.delete(:image_url)
    code = json.delete(:code)
    code[:category_name_l].keep_if{|c| c.is_a?(String) }
    code[:category_name_l].delete("居酒屋")
    code[:category_name_l].delete("ダイニングバー・バー・ビアホール")
    code[:category_name_l].delete("ビストロ")

    json[:gid] = json.delete(:id)
    json[:image_url_1] = image_urls[:shop_image1]
    json[:image_url_2] = image_urls[:shop_image2]
    json[:areaname_s] = code[:areaname_s]
    json[:category_name_l] = code[:category_name_l].join(",")
    new(json.extract!(*column_names))
  end
end
