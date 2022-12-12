class Public::TweetsController < ApplicationController


  def new
    # 空のimpressionインスタンスを生成
    @tweet = Tweet.new
  end

  def create
    #binding.pry
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
    redirect_to tweet_path(@tweet.id)
    else
    render :new
    end
  end

  # 各会員のつぶやき一覧
  def permember
    @user = User.find(params[:id])
    @tweets = @user.tweets.order(created_at: :desc).page(params[:page]).per(4)
  end

# 全てのつぶやき一覧
  def index
    @tweets = Tweet.order(created_at: :desc).page(params[:page]).per(4)
  end

  def show
    @tweet = Tweet.find(params[:id])
    @post_comment = PostComment.new
    # includes(:user)これはネストしたN＋１問題を解決してくれる
    @post_comments = @tweet.post_comments.includes(:user)
  end

  def edit
    @tweet = Tweet.find(params[:id])
    if @tweet.user_id == current_user.id
      render :edit
    else
      redirect_to tweets_path
    end
  end

  def update
    @tweet = Tweet.find(params[:id])
    if @tweet.update(tweet_params)
    redirect_to tweet_path(@tweet), notice: "つぶやき編集しました"
    else
      render :edit
    end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    flash[:danger] = "つぶやきを削除しました"
    redirect_back(fallback_location: root_path)
  end


  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :text)
  end

end
