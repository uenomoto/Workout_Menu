class Public::PostCommentsController < ApplicationController

before_action :authenticate_user!, except:[:destroy]

    def create
      #binding.pry
      @tweet = Tweet.find(params[:tweet_id])
      @post_comment = current_user.post_comments.new(post_comment_params)
      @post_comment.tweet_id = @tweet.id
      if @post_comment.save
        @tweet.create_notification_post_comment!(current_user, @post_comment.id)
        redirect_to request.referer, flash: {success: "コメント投稿しました。"}
      else
        flash[:danger] = "投稿に失敗しました"
        # 遷移前のページに戻る↓
        redirect_back(fallback_location: root_path)
      end
    end

    def edit
      @tweet = Tweet.find(params[:tweet_id])
      @post_comment = PostComment.find(params[:id])
      if @post_comment.user_id == current_user.id
        render :edit
      else
        redirect_to tweet_path(@tweet)
      end
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
      flash[:danger] = "コメントを削除しました"
      redirect_back(fallback_location: root_path)
    end



    private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :tweet_id, :comment)
  end

end
