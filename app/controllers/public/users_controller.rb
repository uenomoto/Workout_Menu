class Public::UsersController < ApplicationController
  def show
  end

  def edit
  end

  def index
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :introduction, :prefecture, :email, :password, :is_deleted, :profile_image)
  end
  
end
