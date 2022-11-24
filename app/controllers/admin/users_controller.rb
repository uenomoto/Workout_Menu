class Admin::UsersController < ApplicationController
  def show
  end
  
  
  
  private
  
  def user_params
    params.require(:user).permit(:nickname, :introduction, :prefecture, :email, :password, :is_deleted, :profile_image)
  end
  
end
