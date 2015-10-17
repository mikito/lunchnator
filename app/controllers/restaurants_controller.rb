class RestaurantsController < ApplicationController
  def draw
    ids = current_user.restaurants.pluck(:id)
    @restaurant = Restaurant.find(ids.sample)
  end
end
