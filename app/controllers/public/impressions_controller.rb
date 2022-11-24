class Public::ImpressionsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end
  
  
  private
  
  def impression_params
    params.require(:impression).permit(:user_id, :text)
  end
  
end
