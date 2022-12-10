class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    def after_sign_in_path_for(resource_or_scope)
      if resource_or_scope.is_a?(Admin)
      flash[:notice]="ログインしました"
      admin_root_path
      else
      flash[:notice]="今日もレッツトレーニング！"
      root_path
      end
    end


    def after_sign_out_path_for(resource_or_scope)
      if resource_or_scope == :admin
      flash[:notice]="ログアウトしました"
      new_admin_session_path
      else
      flash[:notice]="お疲れ様でした！"
      about_path
      end
    end



    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:nickname])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :prefecture, :email, :password])
    end
end
