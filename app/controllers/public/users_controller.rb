class Public::UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def index
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      #flash[:notice] =
    redirect_to user_path(current_user)
    else
      render :edit
    end
  end

  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    #flash[:notice] = ""
    redirect_to about_path
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :prefecture, :email, :password, :is_deleted, :profile_image)
  end

end
