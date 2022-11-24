class Public::TrainingNamesController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  
  private
  
  def training_name_params
    params.require(:training_name).permit(:genre_id, :user_id, :name, :introduction)
  end
  
end
