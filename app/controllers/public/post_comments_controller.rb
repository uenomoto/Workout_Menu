class Public::PostCommentsController < ApplicationController


    def create
      #binding.pry
      @impression = Impression.find(params[:impression_id])
      @post_comment = current_user.post_comments.new(post_comment_params)
      @post_comment.impression_id = @impression.id
      if @post_comment.save
        redirect_to request.referer, notice: "コメント投稿しました"
      else
        flash[:danger] = "投稿に失敗しました"
        # 遷移前のページに戻る↓
        redirect_back(fallback_location: root_path)
      end
    end

    def edit
      @impression = Impression.find(params[:impression_id])
      @post_comment = PostComment.find(params[:id])
      if @post_comment.user_id == current_user.id
        render :edit
      else
        redirect_to impression_path(@impression)
      end
    end

    def update
      @impression = Impression.find(params[:impression_id])
      @post_comment = PostComment.find(params[:id])
      if @post_comment.update(post_comment_params)
        redirect_to impression_path(@impression), notice: "コメントを編集しました"
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
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end

end
