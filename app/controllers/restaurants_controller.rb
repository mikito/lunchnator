class RestaurantsController < BaseController 
  def draw
    ids = current_user.restaurants.pluck(:id)

    if ids.empty?
      render :empty
    else
      @restaurant = Restaurant.find(ids.sample)
    end
  end
end
