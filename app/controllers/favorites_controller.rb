class FavoritesController < ApplicationController
  
  def index
    @favorite_classworks = current_user.favorite_classworks
  end
  
  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.classwork_id = params[:classwork_id]
    if favorite.save
        redirect_to classworks_search_path, success: 'お気に入りに登録しました'
    else
        redirect_to classworks_search_path, danger: 'お気に入り登録に失敗しました'
    end
  end
  
  def destroy
    favorite = current_user.favorites.find_by(classwork_id: params[:classwork_id])
    if favorite.destroy
      redirect_to classworks_search_path, success: 'お気に入り登録を解除しました'
    else
      redirect_to classworks_search_path, danger: 'お気に入り登録の解除に失敗しました'
    end
  end
  #   @favorites_count = Favorite.where(classwork_id: 000.id).count
end
