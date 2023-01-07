class Admin::HomesController < ApplicationController

before_action :authenticate_admin!

 def top
  if params[:is_deleted] == 'false'
   @users = User.where(is_deleted: false).order(created_at: :desc).page(params[:page]).per(10)
  elsif params[:is_deleted] == 'true'
   @users = User.where(is_deleted: true).order(created_at: :desc).page(params[:page]).per(10)
  else
   @users = User.order(created_at: :desc).page(params[:page]).per(10)
  end
 end

end
