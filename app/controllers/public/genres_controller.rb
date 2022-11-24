class Public::GenresController < ApplicationController
  def index
  end

  def edit
  end
  
  
  private
  
  def genre_params
    params.require(:genre).permit(:name)
  end
  
end
