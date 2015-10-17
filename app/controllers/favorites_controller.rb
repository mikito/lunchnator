class FavoritesController < BaseController
  def index
  end

  def new
    @restaurants = GuruNaviApi.restaurants(query: params[:search]) if params[:search]
  end

  def create
    restaurant = Restaurant.find_by(gid: params[:gid])
    restaurant||= GuruNaviApi.restaurants(query: { id: params[:gid] }).first
    current_user.favorites.find_or_create_by!(restaurant: restaurant)
    redirect_to root_path, notice: "#{restaurant.name}をお気に入りに追加しました"
  end

  def destroy
  end
end
