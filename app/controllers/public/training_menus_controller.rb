class Public::TrainingMenusController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def edit
  end
  
  
  private
  
  def training_menu_params
    params.require(:training_menu).permit(:user_id, :training_name_id, :date, :count, :set, :status, :weight)
  end
  
end
