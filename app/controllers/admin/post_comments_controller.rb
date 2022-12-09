class Admin::PostCommentsController < ApplicationController


  def index
    @post_comments = PostComment.order(created_at: :desc).page(params[:page]).per(6)
  end

  def show

  end



  private

  def post_comment_params
    params.require(:post_comment).permit(:user_id, :impression_id, :comment)
  end

end
