class Public::NotificationsController < ApplicationController

before_action :authenticate_user!

  def index
    @notifications = current_user.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
    notification.update(checked: true)
   end
  end
  # update_attributesはrails6.1で廃止されたorz

  def destroy_all
    @notifications = current_user.passive_notifications.destroy_all
    flash[:danger] = '通知記録を全削除しました。'
    redirect_to notifications_path
  end

end