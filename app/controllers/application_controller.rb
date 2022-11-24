class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    protected
    
    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :nickname])
        devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :prefecture, :email, :password])
    end
end
