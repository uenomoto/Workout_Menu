class Public::RelationshipsController < ApplicationController
  before_action :authenticate_user!

# フォロー機能を作成・保存
  def create
    current_user.follow(params[:user_id])
    @user = current_user
    @user.create_notification_follow!(current_user, params[:user_id])
    redirect_to request.referer
  end
# フォローを削除、メソッドはuserモデルで記述
  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  # フォロー一覧を表示する
  def followings
    user = User.find(params[:user_id])
    @users = user.followings
  end
# フォロワー一覧を表示する
  def followers
    user = User.find(params[:user_id])
    @users = user.followers
  end

end
