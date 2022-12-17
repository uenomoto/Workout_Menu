class Users::SessionsController < Devise::SessionsController

# ゲストログイン
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to user_path(user), flash: {success: "ゲストとしてログインしました。"}
  end
end
