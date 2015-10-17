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

class Restaurant < ActiveRecord::Base
end
