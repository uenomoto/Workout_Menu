class Admin::TweetsController < ApplicationController

before_action :authenticate_admin!

  def index
    # 通報があったツイートだけを多い順で並べる
    if params[:order] == 'desc'
      @tweets = Tweet.joins(:reports).group(:tweet_id).order('count(tweet_id) desc').page(params[:page]).per(5)
    # 通報があったツイートだけを少ない順で並べる
    elsif params[:order] == 'asc'
      @tweets = Tweet.joins(:reports).group(:tweet_id).order('count(tweet_id) asc').page(params[:page]).per(5)
    # すべての投稿を表示
    else
      @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(5)
    end
  end

  def show
    @tweet = Tweet.find(params[:id])
    @post_comments = @tweet.post_comments
  end

  def permember
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page]).per(5)
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to admin_tweets_path
  end


  private


end
