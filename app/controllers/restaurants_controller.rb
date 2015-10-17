class RestaurantsController < ApplicationController
  def index
  end

  def draw
    longitude = params[:data][:longitude].to_f
    latitude = params[:data][:latitude].to_f
    ids = current_user.restaurants.around(longitude, latitude).pluck(:id)
    render :empty and return if ids.empty?

    @restaurant = Restaurant.find(ids.sample)

    render layout: false
  end
end
