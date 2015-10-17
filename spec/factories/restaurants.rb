# == Schema Information
#
# Table name: restaurants
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  latitude    :float(24)
#  longitude   :float(24)
#  address     :string(255)
#  opentime    :string(255)
#  areaname_s  :string(255)
#  image_url_1 :string(255)
#  image_url_2 :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :restaurant do
    name "MyString"
latitude 1.5
longitude 1.5
address "MyString"
opentime "MyString"
areaname_s "MyString"
image_url_1 "MyString"
image_url_2 "MyString"
  end

end
