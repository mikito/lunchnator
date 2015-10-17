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

require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
