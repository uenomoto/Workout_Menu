class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
      flash[:success]="ログインしました"
      admin_root_path
      else
      flash[:success]="今日もレッツトレーニング！"
      user_path(current_user)
      end
    end


    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
      flash[:danger]="ログアウトしました"
      new_admin_session_path
      else
      flash[:info] = "継続して頑張りましょう！"
      root_path
      end
    end

    add_flash_types :success, :info, :warning, :danger

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :prefecture, :email, :password])
    end
end
