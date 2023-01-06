class Public::PostCommentsController < ApplicationController

before_action :authenticate_user!, except:[:destroy]
before_action :current_user?, only: [:edit]

    def create
      #binding.pry
      @tweet = Tweet.find(params[:tweet_id])
      @post_comment = current_user.post_comments.new(post_comment_params)
      @post_comment.tweet_id = @tweet.id
      if @post_comment.save
        @tweet.create_notification_post_comment!(current_user, @post_comment.id)
        flash.now[:success] = 'コメントを投稿しました'
        #非同期通信,jsのファイル指定
        @post_comments = @tweet.post_comments
        render :comments
      else
        flash.now[:danger] = "コメント入力してください"
        @post_comments = @tweet.post_comments
        render :comments
      end
    end

    def edit
      @tweet = Tweet.find(params[:tweet_id])
      @post_comment = PostComment.find(params[:id])
    end

    def update
      @tweet = Tweet.find(params[:tweet_id])
      @post_comment = PostComment.find(params[:id])
      if @post_comment.update(post_comment_params)
        redirect_to tweet_path(@tweet), flash: {info: "コメント編集しました。"}
      else
        flash.now[:danger] = "編集に失敗しました"
        render :edit
      end
    end

    def destroy
      @post_comment = PostComment.find(params[:id])
      @post_comment.destroy
      flash.now[:danger] = 'コメントを削除しました'
      #renderしたときに@tweetのデータがないので@tweetを定義
      @tweet = Tweet.find(params[:tweet_id])
      @post_comments = @tweet.post_comments
      if user_signed_in?
        render :comments
      elsif admin_signed_in?
        render 'admin/tweets/destroy'
      end
    end



    private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :tweet_id, :comment)
  end

  def current_user?
      @post_comment = PostComment.find(params[:id])
    if @post_comment.user_id != current_user.id
      redirect_to main_path, flash: {danger: 'ご本人様ではないので編集できません。'}
    end
  end

end
