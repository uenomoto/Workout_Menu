class Admin::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def withdraw
    # binding.pry
    @user = User.find(params[:id])
    @user.update(is_deleted: params[:user][:is_deleted])
    redirect_to request.referer
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :prefecture, :email, :password, :is_deleted, :profile_image)
  end

end
