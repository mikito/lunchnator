class TopController < BaseController
  def index
    @restaurants = current_user.restaurants.page(params[:page])
  end
end
