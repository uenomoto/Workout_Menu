class Admin::HomesController < ApplicationController

before_action :authenticate_admin!

 def top
  @users = User.all.order(created_at: :desc).page(params[:page]).per(10)
 end

end
