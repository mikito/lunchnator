class RestaurantsController < ApplicationController
  def index
  end

  def draw
    ids = current_user.restaurants.pluck(:id)
    render :empty and return if ids.empty?

    @restaurant = Restaurant.find(ids.sample)

    render layout: false
  end
end
