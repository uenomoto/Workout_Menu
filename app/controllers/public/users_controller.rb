class Public::UsersController < ApplicationController

  before_action :authenticate_user!
  before_action :ensure_guest_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.where(is_deleted: false).order(created_at: :desc).page(params[:page]).per(10)
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
    redirect_to user_path(current_user), flash: {success: "編集しました。"}
    else
      flash.now[:danger] = "編集失敗しました。"
      render :edit
    end
  end
# 理論削除
  def withdraw
    @user = current_user
    @user.update(is_deleted: true)
    reset_session
    redirect_to about_path, flash: {warning: "退会しました。ご利用ありがとうございました。"}
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :introduction, :prefecture, :email, :password, :is_deleted, :profile_image)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.nickname == "guestuser"
      redirect_to user_path(current_user), flash: {danger: 'ゲストユーザーはプロフィール編集画面へ遷移できません。'}
    end
  end

end
