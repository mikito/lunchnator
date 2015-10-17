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

FactoryGirl.define do
  factory :restaurant do
    gid "MyGid"
    name "MyString"
    url "MyUrl"
    latitude 1.0
    longitude 1.0
    address "MyString"
    opentime "MyString"
    areaname_s "MyString"
    image_url_1 "MyString"
    image_url_2 "MyString"
  end
end
