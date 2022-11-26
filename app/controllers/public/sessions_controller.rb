# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  before_action :user_state, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected
  #退会しているかの判断メソッド
  def user_state
    @user = User.find_by(nickname: params[:user][:nickname])
    if @user
      #取得したアカウントのパスと入力されたパスが一致しているかつ退会フラグがtrueだったらサインアップ画面へ
      if (@user.valid_password?(params[:user][:password]) && (@user.is_deleted == true))
        redirect_to new_user_registration_path
      end
    end
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
