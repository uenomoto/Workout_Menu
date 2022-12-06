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
      
    end

    def update
    end

    def destroy
    end



    private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end

end
