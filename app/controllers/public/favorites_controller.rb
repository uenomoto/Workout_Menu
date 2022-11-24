class Public::FavoritesController < ApplicationController
    
    
    
    
    private
  
  def favorite_params
    params.require(:favorite).permit(:user_id, :impression_id)
  end
    
end
