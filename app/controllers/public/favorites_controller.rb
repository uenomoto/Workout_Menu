class Public::FavoritesController < ApplicationController

  before_action :authenticate_user!


    def create
      @tweet = Tweet.find(params[:tweet_id])
      @favorite = current_user.favorites.new(tweet_id: @tweet.id)
      @favorite.save
      @tweet.create_notification_favorite!(current_user)
    end

    def destroy
      @tweet = Tweet.find(params[:tweet_id])
      @favorite = current_user.favorites.find_by(tweet_id: @tweet.id)
      @favorite.destroy
    end

end
