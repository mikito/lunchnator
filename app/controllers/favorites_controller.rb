class FavoritesController < BaseController
  def index
  end

  def new
    @favorite = Favorite.new
    @restaurants = GuruNaviApi.restaurants(query: params[:search]) if params[:search]
  end

  def search

  end

  def create
  end

  def destroy
  end
end
