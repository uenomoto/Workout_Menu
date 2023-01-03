class Users::SessionsController < Devise::SessionsController

# ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), flash: {success: "ゲストとしてログインしました。"}
  end

# ゲストは物理削除
  def destory
    if current_user.nickname == "guestuser"
     User.find(current_user.id).destroy
     redirect_to root_path, flash: {primary: "よろしかったら本登録お待ちしております！、ご利用ありがとうございました。"}
   end
  end

end
