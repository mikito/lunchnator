# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  gid         :string(255)      not null
#  name        :string(255)      not null
#  url         :string(255)      not null
#  latitude    :float(24)
#  longitude   :float(24)
#  address     :string(255)      not null
#  opentime    :string(255)
#  areaname_s  :string(255)      not null
#  image_url_1 :string(255)
#  image_url_2 :string(255)
#

class Restaurant < ActiveRecord::Base
  def self.build_from_api(json)
    image_urls = json.delete(:image_url)
    json[:gid] = json.delete(:id)
    json[:image_url_1] = image_urls[:shop_image1]
    json[:image_url_2] = image_urls[:shop_image2]
    json[:areaname_s] = json.delete(:code)[:areaname_s]
    new(json.extract!(*column_names))
  end
end
