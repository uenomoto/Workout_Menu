class Public::ReportsController < ApplicationController

  before_action :authenticate_user!

  def create
    report = current_user.reports.new(tweet_id: params[:tweet_id])
    if report.save
      redirect_to request.referer, flash: {danger: "不適切なツイートを通報しました。"}
    end
  end


end
