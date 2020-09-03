class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.create(facility_id: params[:facility_id])
    redirect_to facility_path(params[:facility_id])
  end
  def destroy
    favorite = current_user.favorites.find_by(id: params[:id]).destroy
    redirect_to facility_path(favorite.facility.id)
  end
end
